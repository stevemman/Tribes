package models;

import core.TribesConfig;
import core.Types;
import core.actions.Action;
import core.actors.Building;
import core.actors.City;
import core.actors.Temple;
import core.actors.Tribe;
import core.game.Board;
import core.game.GameState;
import org.tensorflow.SavedModelBundle;
import org.tensorflow.Tensor;
import org.tensorflow.Tensors;
import utils.Vector2d;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

public class BuildFM {
    // Uncomment bellow for when running on the cluster.
//    private static String savedModelPath = "./1597599376";
//    private static String savedModelPath2 = "./1597599377";
    private static String savedModelPath = new File("").getAbsolutePath().concat("/data/trained_models/build/pop/1597599376");
    private static String savedModelPath2 = new File("").getAbsolutePath().concat("/data/trained_models/build/pro/1597599377");
    private static SavedModelBundle popModel;
    private static SavedModelBundle proModel;
    private static final AtomicBoolean initializedPop = new AtomicBoolean(false);
    private static final AtomicBoolean initializedPro = new AtomicBoolean(false);

    public synchronized static boolean use(GameState gs, Action action) {
        //Extract data from the action description.
        String[] splitDesc = action.toString().split(" ");
        int cityID = Integer.parseInt(splitDesc[3]);
        int targetX = Integer.parseInt(splitDesc[5]);
        int targetY = Integer.parseInt(splitDesc[7]);
        Vector2d targetPos = new Vector2d(targetX, targetY);

        // We add 1 so that 0 can be used to indicate no building
        int buildingKey = Types.BUILDING.stringToType(splitDesc[9]).getKey() + 1;

        // Initialize the array that will store our 8 features.
        float[] values = new float[12];


        // Insert the values in the order that is required by the model.
        values[0] = buildingKey;
        Board b = gs.getBoard();
        int index = 1;
        for(Vector2d pos : targetPos.neighborhood(1, -1, b.getSize() + 1))
        {
            if((pos.x >= 0 && pos.y >= 0 && pos.x < b.getSize() && pos.y < b.getSize())) {
                values[index] = (b.getBuildingAt(pos.x, pos.y) == null ? 0 : b.getBuildingAt(pos.x, pos.y).getKey()+1);
            }else{
                values[index] = 0;
            }
            index++;
        }

        // Make sure that the model is loaded.
        if (initializedPop.compareAndSet(false, true)) {
            initializePop();
        }
        if (initializedPro.compareAndSet(false, true)) {
            initializePro();
        }

        // Stores the tensors that can be discarded after use.
        final List<Tensor<?>> tensorsToClose = new ArrayList<Tensor<?>>(20);

        // Feed the model.
        try
        {
            final Tensor<?> result = popModel.session().runner()
                    .feed("building"  , toTensor(values[0], tensorsToClose))
                    .feed("n1"  , toTensor(values[1], tensorsToClose))
                    .feed("n2" , toTensor(values[2], tensorsToClose))
                    .feed("n3" , toTensor(values[3], tensorsToClose))
                    .feed("n4"      , toTensor(values[4], tensorsToClose))
                    .feed("n5"      , toTensor(values[5], tensorsToClose))
                    .feed("n6" , toTensor(values[6], tensorsToClose))
                    .feed("n7" , toTensor(values[7], tensorsToClose))
                    .feed("n8" , toTensor(values[8], tensorsToClose))
                    .feed("old_level" , toTensor(values[11], tensorsToClose))
                    .feed("old_population" , toTensor(values[9], tensorsToClose))
                    .feed("old_production" , toTensor(values[10], tensorsToClose))
                    //use the saved model CLI shipping with tensorflow to determine the name
                    //of the result node
                    .fetch("dnn/head/predictions/probabilities:0")
                    .run()
                    .get(0);
            final Tensor<?> result2 = proModel.session().runner()
                    .feed("building"  , toTensor(values[0], tensorsToClose))
                    .feed("n1"  , toTensor(values[1], tensorsToClose))
                    .feed("n2" , toTensor(values[2], tensorsToClose))
                    .feed("n3" , toTensor(values[3], tensorsToClose))
                    .feed("n4"      , toTensor(values[4], tensorsToClose))
                    .feed("n5"      , toTensor(values[5], tensorsToClose))
                    .feed("n6" , toTensor(values[6], tensorsToClose))
                    .feed("n7" , toTensor(values[7], tensorsToClose))
                    .feed("n8" , toTensor(values[8], tensorsToClose))
                    .feed("old_level" , toTensor(values[11], tensorsToClose))
                    .feed("old_population" , toTensor(values[9], tensorsToClose))
                    .feed("old_production" , toTensor(values[10], tensorsToClose))
                    //use the saved model CLI shipping with tensorflow to determine the name
                    //of the result node
                    .fetch("dnn/head/predictions/probabilities:0")
                    .run()
                    .get(0);
            //remember to close result tensors as well
            tensorsToClose.add(result);
            tensorsToClose.add(result2);

            float[][] resultValuesPop = result.copyTo(new float[1][7]);
            float[][] resultValuesPro = result2.copyTo(new float[1][18]);

            int predictionPopChange = 0;
            float max = 0;
            for(int i=0; i<3; i++) {
                if(resultValuesPop[0][i]>max){
                    max = resultValuesPop[0][i];
                    predictionPopChange = i;
                }
            }

            int predictionProChange = 0;
            max = 0;
            for(int i=0; i<3; i++) {
                if(resultValuesPro[0][i]>max){
                    max = resultValuesPro[0][i];
                    predictionProChange = i;
                }
            }

            // Check if action is feasible before execution.
            if(action.isFeasible(gs)) {
                City city = (City) gs.getActor(cityID);
                Tribe tribe = gs.getTribe(city.getTribeId());
                Types.BUILDING buildingType = Types.BUILDING.getTypeByKey(buildingKey-1);

                // Charge the tribe for the building.
                tribe.subtractStars(buildingType.getCost());

                // Update the board.
                b.setBuildingAt(targetPos.x, targetPos.y, buildingType);
                b.setResourceAt(targetPos.x, targetPos.y, null);

                // Add the new building to the city
                LinkedList<Building> buildingsOfCity = city.getBuildings();
                if(buildingType.isTemple()) {
                    buildingsOfCity.add(new Temple(targetPos.x, targetPos.y, buildingType, cityID));
                } else {
                    buildingsOfCity.add(new Building(targetPos.x, targetPos.y, buildingType, cityID));
                }
                city.setBuildings(buildingsOfCity);

                // Update the city with our predicted population and production changes.
                // Adding population in a city also increases a tribe's score
                city.setPopulation(city.getPopulation() + predictionPopChange);
                tribe.addScore(predictionPopChange * TribesConfig.POINTS_PER_POPULATION);
                city.addPointsWorth(predictionPopChange * TribesConfig.POINTS_PER_POPULATION);
                city.setProduction(city.getProduction() + predictionProChange);

                // Take care of special requirements for buildings.

                // Update the trade network.
                if(buildingType == Types.BUILDING.PORT)
                    b.buildPort(targetPos.x, targetPos.y);
                // Add score for building a temple.
                if(buildingType.isTemple())
                    tribe.addScore(TribesConfig.TEMPLE_POINTS[0]);
                // Add score for building a monument and update the tribe.
                if(buildingType.isMonument()) {
                    tribe.monumentIsBuilt(buildingType);
                    tribe.addScore(TribesConfig.MONUMENT_POINTS);
                }
                // In case the building gets removed later, replace the terrain underneath.
                if(buildingType == Types.BUILDING.LUMBER_HUT)
                    b.setTerrainAt(targetPos.x, targetPos.y, Types.TERRAIN.PLAIN);

                return true;
            }
            return false;
        }
        catch (final NumberFormatException nfe) {}
        finally { closeTensors(tensorsToClose); }

        return false;
    }

    public static void initializePop() {
        //load SavedModel
        final File savedModelFolderPop = new File(savedModelPath);
        if (!savedModelFolderPop.isDirectory() || !savedModelFolderPop.canRead()) {
            System.err.println("Cannot read folder");
            System.exit(-1);
        }
        popModel = SavedModelBundle.load(savedModelPath, "serve");
    }

    public static void initializePro() {
        //load SavedModel
        final File savedModelFolderPro = new File(savedModelPath2);
        if (!savedModelFolderPro.isDirectory() || !savedModelFolderPro.canRead()) {
            System.err.println("Cannot read folder");
            System.exit(-1);
        }
        proModel = SavedModelBundle.load(savedModelPath2, "serve");
    }

    /**
     * wraps a single float in a tensor
     * @param f the float to wrap
     * @return a tensor containing the float
     */
    private static Tensor<Float> toTensor(final float f, final Collection<Tensor<?>> tensorsToClose) {
        final Tensor<Float> t = Tensors.create(f);
        if (tensorsToClose != null) {
            tensorsToClose.add(t);
        }
        return t;
    }

    private static void closeTensors(final Collection<Tensor<?>> ts) {
        for (final Tensor<?> t : ts) {
            try {
                t.close();
            } catch (final Exception e) {
                System.err.println("Error closing Tensor.");
                e.printStackTrace();
            }
        }
        ts.clear();
    }

}
