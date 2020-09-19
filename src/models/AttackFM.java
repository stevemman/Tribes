package models;

import core.Types;
import core.actors.Tribe;
import core.actors.units.Unit;
import core.game.Board;
import org.tensorflow.SavedModelBundle;
import core.actions.Action;
import core.game.GameState;
import org.tensorflow.Tensor;
import org.tensorflow.Tensors;
import utils.Vector2d;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

import static core.Types.UNIT.*;

public class AttackFM {

    //private static String savedModelPath = "./1595793120";
    private static String savedModelPath = new File("").getAbsolutePath().concat("/data/trained_models/attack/regressor/1595793120");
    private static SavedModelBundle model;
    private static final AtomicBoolean initialized = new AtomicBoolean(false);

    public synchronized static boolean use(GameState gs, Action action) {
        String[] splitDesc = action.toString().split(" ");
        int sourceId = Integer.parseInt(splitDesc[3]);
        int targetId = Integer.parseInt(splitDesc[6]);
        Board b = gs.getBoard();
        Unit source = (Unit) gs.getActor(sourceId);
        Unit target = (Unit) gs.getActor(targetId);
        int sx = source.getPosition().x;
        int sy = source.getPosition().y;
        int tx = target.getPosition().x;
        int ty = target.getPosition().y;

        // Initialize the array that will store our 8 features.
        float[] values = new float[8];

        if (gs.getActor(sourceId) == null || gs.getActor(targetId) == null) {
            System.err.println("Either the source or the target unit IDs do not exit in this gamestate");
            System.exit(-1);
        }

        // Insert the values in the order that is required by the model.
        values[0] = source.ATK;
        values[1] = target.ATK;
        values[2] = source.DEF;
        values[3] = target.DEF;
        values[4] = source.getCurrentHP();
        values[5] = target.getCurrentHP();
        values[6] = b.getTerrainAt(sx,sy) == null ? 0 : b.getTerrainAt(sx,sy).getKey();
        values[7] = b.getTerrainAt(tx,ty) == null ? 0 : b.getTerrainAt(tx,ty).getKey();

        // Make sure that the model is loaded.
        if (initialized.compareAndSet(false, true)) {
            initialize();
        }

        // Stores the tensors that can be discarded after use.
        final List<Tensor<?>> tensorsToClose = new ArrayList<Tensor<?>>(20);

        // Feed the model.
        try
        {
            final Tensor<?> result = model.session().runner()
                .feed("old_attack_source"  , toTensor(values[0], tensorsToClose))
                .feed("old_attack_target"  , toTensor(values[1], tensorsToClose))
                .feed("old_defence_source" , toTensor(values[2], tensorsToClose))
                .feed("old_defence_target" , toTensor(values[3], tensorsToClose))
                .feed("old_hp_source"      , toTensor(values[4], tensorsToClose))
                .feed("old_hp_target"      , toTensor(values[5], tensorsToClose))
                .feed("old_terrain_source_1:0" , toTensor(values[6], tensorsToClose))
                .feed("old_terrain_target_1:0" , toTensor(values[7], tensorsToClose))
                .fetch("dnn/logits/BiasAdd:0")
                .run()
                .get(0);

            // Remember to close result tensor as well.
            tensorsToClose.add(result);

            // Unpack the result.
            float[][] resultValues = result.copyTo(new float[1][2]);

            final int predictedHpSource = Math.max(0, Math.round(resultValues[0][0]));
            final int predictedHpTarget = Math.max(0, Math.round(resultValues[0][1]));

            // Check if action is feasible before execution.
            if(action.isFeasible(gs)) {
                source.transitionToStatus(Types.TURN_STATUS.ATTACKED);
                Tribe attackerTribe = gs.getTribe(source.getTribeId());
                attackerTribe.resetPacifistCount();

                // Source wins.
                if(predictedHpTarget == 0) {
                    source.addKill();
                    attackerTribe.addKill();

                    //Actually kill the unit
                    gs.killUnit(target);

                    //After killing the unit, move to target position if unit is melee type
                    switch (source.getType()) {
                        case DEFENDER:
                        case SWORDMAN:
                        case RIDER:
                        case WARRIOR:
                        case KNIGHT:
                        case SUPERUNIT:
                            gs.getBoard().tryPush(attackerTribe, source, source.getPosition().x, source.getPosition().y,
                                                  target.getPosition().x, target.getPosition().y, gs.getRandomGenerator());
                    }
                }else {
                    // Draw.
                    target.setCurrentHP(predictedHpTarget);

                    //Retaliation attack

                    //Check if this unit is in target's attacking range (we can use chebichev distance)
                    double distance = Vector2d.chebychevDistance(source.getPosition(), target.getPosition());
                    if(distance <= target.RANGE)
                    {
                        //Deal damage based on targets defence stat, regardless of this units defence stat
                        source.setCurrentHP(predictedHpSource);
                        //Check if attack kills this unit, if it does add a kill to the target
                        if(source.getCurrentHP() <=0 ) {
                            // Target wins.
                            target.addKill();
                            gs.getTribe(target.getTribeId()).addKill();

                            //Actually kill the unit
                            gs.killUnit(source);
                        }
                    }
                }
                return true;
            }
        }
        catch (final NumberFormatException nfe) {}
        finally { closeTensors(tensorsToClose); }

        return false;
    }

    public static void initialize() {
        if(model == null) {
            //load SavedModel
            final File savedModelFolder = new File(savedModelPath);
            if (!savedModelFolder.isDirectory() || !savedModelFolder.canRead()) {
                System.err.println("Cannot read folder '" + savedModelFolder + "'");
                System.exit(-1);
            }
            model = SavedModelBundle.load(savedModelPath, "serve");
        }
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
