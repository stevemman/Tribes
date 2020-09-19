package utils;

import core.Constants;
import core.Types;
import core.actions.Action;
import core.actors.City;
import core.game.Board;
import core.game.GameState;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.concurrent.atomic.AtomicBoolean;

public class BuildLogger {

    private static String path = Constants.LOG_PATH;
    private static String columns = "building,n1,n2,n3,n4,n5,n6,n7,n8,old_population,old_production,old_level," +
                                    "new_population,new_production,new_level\n";
    private static ArrayList<String> entries = new ArrayList<>();
    private static BufferedWriter writer;
    private static final AtomicBoolean firstEntry = new AtomicBoolean(false);

    public static void log(GameState oldGS, Action action, GameState newGS) {
        StringBuilder entry = new StringBuilder();

        //Keep logs only for build actions.
        String actionDesc = action.toString();
        if (!actionDesc.contains("BUILD")) { return; }

        //Add the header to the log file.
        if (firstEntry.compareAndSet(false, true)) {
            entries.add(columns);
        }

        //Extract data from the action description.
        String[] splitDesc = actionDesc.split(" ");
        int cityID = Integer.parseInt(splitDesc[3]);
        int targetX = Integer.parseInt(splitDesc[5]);
        int targetY = Integer.parseInt(splitDesc[7]);
        Vector2d targetPos = new Vector2d(targetX, targetY);
        // We add 1 so that 0 can be used to indicate no building
        int buildingKey = Types.BUILDING.stringToType(splitDesc[9]).getKey() + 1;

        entry.append(processOldGS(oldGS, cityID, targetPos, buildingKey));
        entry.append(processNewGS(newGS, cityID));

        entries.add(entry.toString());
    }

    private static String processOldGS(GameState gs, int cityID, Vector2d targetPos, int buildingKey) {
        StringBuilder result = new StringBuilder();
        Board b = gs.getBoard();
        City c = (City) b.getActor(cityID);

        result.append(buildingKey);
        result.append(',');

        for(Vector2d pos : targetPos.neighborhood(1, -1, b.getSize() + 1))
        {
            if((pos.x >= 0 && pos.y >= 0 && pos.x < b.getSize() && pos.y < b.getSize())) {
                result.append(b.getBuildingAt(pos.x, pos.y) == null ? 0 : b.getBuildingAt(pos.x, pos.y).getKey()+1);
                result.append(',');
            }else{
                result.append(0);
                result.append(',');
            }
        }

        result.append(c.getPopulation());
        result.append(',');
        result.append(c.getProduction());
        result.append(',');
        result.append(c.getLevel());
        result.append(',');

        return result.toString();
    }

    private static String processNewGS(GameState gs, int cityID) {
        StringBuilder result = new StringBuilder();
        Board b = gs.getBoard();
        City c = (City) b.getActor(cityID);

        result.append(c.getPopulation());
        result.append(',');
        result.append(c.getProduction());
        result.append(',');
        result.append(c.getLevel());
        result.append('\n');

        return result.toString();
    }

    public static void close() {
        try {
            for (String entry : entries) { write(String.valueOf(entry)); }
            writer.flush();
            entries.clear();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static synchronized BufferedWriter getWriter() {
        try{
            if( writer == null )
            {
                writer =  new BufferedWriter(new FileWriter(path, true));
            }

            return writer;
        }
        catch(Exception e)
        {
            throw new RuntimeException(e);
        }
    }

    public static void write(String entry) {
        try{
            getWriter().write(entry);
            getWriter().flush();
        }
        catch(Exception e)
        {
            throw new RuntimeException(e);
        }
    }
}
