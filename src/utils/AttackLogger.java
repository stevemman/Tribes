package utils;

import core.Constants;
import core.actions.Action;
import core.actors.units.Unit;
import core.game.Board;
import core.game.GameState;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.concurrent.atomic.AtomicBoolean;

public class AttackLogger {

    private static String path = Constants.LOG_PATH;
    private static String columns = "old_terrain_source,old_hp_source,old_attack_source,old_defence_source,"+
                                    "old_terrain_target,old_hp_target,old_attack_target,old_defence_target,"+
                                    "new_hp_source,new_hp_target,result\n";
    private static ArrayList<String> entries = new ArrayList<>();
    private static BufferedWriter writer;
    private static final AtomicBoolean firstEntry = new AtomicBoolean(false);

    public static void log(GameState oldGS, Action action, GameState newGS) {
        StringBuilder entry = new StringBuilder();

        //Keep logs only for attack actions.
        String actionDesc = action.toString();
        if (!actionDesc.contains("ATTACK")) { return; }

        //Add the header to the log file.
        if (firstEntry.compareAndSet(false, true)) {
            entries.add(columns);
        }

        //Extract unitIDs from the action description.
        String[] splitDesc = actionDesc.split(" ");
        int sourceId = Integer.parseInt(splitDesc[3]);
        int targetId = Integer.parseInt(splitDesc[6]);

        //Avoid logging actions for units that for some reason don't exist.
        if (!(oldGS.getActor(sourceId) == null && oldGS.getActor(targetId) == null)) {
            if (!(newGS.getActor(sourceId) == null && newGS.getActor(targetId) == null)) {
                //Actual logging.
                entry.append(processOldGS(oldGS, sourceId, targetId));
                entry.append(processNewGS(newGS, sourceId, targetId));

                entries.add(entry.toString());
            }
        }
    }

    private static String processOldGS(GameState gs, int sourceId, int targetId) {
        StringBuilder result = new StringBuilder();
        Board b = gs.getBoard();
        Unit source = (Unit) gs.getActor(sourceId);
        Unit target = (Unit) gs.getActor(targetId);
        int sx = source.getPosition().x;
        int sy = source.getPosition().y;
        int tx = target.getPosition().x;
        int ty = target.getPosition().y;

        //Source
        result.append(b.getTerrainAt(sx,sy) == null ? 0 : b.getTerrainAt(sx,sy).getKey());
        result.append(',');
        result.append(source.getCurrentHP());
        result.append(',');
        result.append(source.ATK);
        result.append(',');
        result.append(source.DEF);
        result.append(',');

        //Target
        result.append(b.getTerrainAt(tx,ty) == null ? 0 : b.getTerrainAt(tx,ty).getKey());
        result.append(',');
        result.append(target.getCurrentHP());
        result.append(',');
        result.append(target.ATK);
        result.append(',');
        result.append(target.DEF);
        result.append(',');

        return result.toString();
    }

    private static String processNewGS(GameState gs, int sourceId, int targetId) {
        StringBuilder result = new StringBuilder();
        int res = 0;

        boolean died_source = gs.getActor(sourceId) == null;
        boolean died_target = gs.getActor(targetId) == null;

        // We ignore the case that both source and target die, that shouldn't happen.
        if (!died_source & !died_target) { res = 0; } //Draw
        if (!died_source & died_target) { res = 1; } //Source won
        if (died_source & !died_target) { res = 2; } //Target won

        switch (res) {
            case 0: //Draw.
                result.append(((Unit) gs.getActor(sourceId)).getCurrentHP());
                result.append(',');
                result.append(((Unit) gs.getActor(targetId)).getCurrentHP());
                result.append(',');
                result.append(res);
                result.append('\n');
                break;
            case 1: //Source won
                result.append(((Unit) gs.getActor(sourceId)).getCurrentHP());
                result.append(',');
                result.append(0);
                result.append(',');
                result.append(res);
                result.append('\n');
                break;
            case 2: //Target won
                result.append(0);
                result.append(',');
                result.append(((Unit) gs.getActor(targetId)).getCurrentHP());
                result.append(',');
                result.append(res);
                result.append('\n');
                break;
        }

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
