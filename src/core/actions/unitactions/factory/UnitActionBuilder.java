package core.actions.unitactions.factory;

import core.actions.Action;
import core.actors.units.Unit;
import core.game.GameState;

import java.util.ArrayList;

public class UnitActionBuilder {

    public ArrayList<Action> getActions(GameState gs, Unit unit) {
        ArrayList<Action> allActions = new ArrayList<>();

        if (unit.getTribeId() != gs.getActiveTribeID()) {
            System.out.println("ERROR: creating actions for unit " + unit.getActorId() + " that the current tribe (" + gs.getActiveTribeID() +
                    ") does not control (" + unit.getTribeId() + ").");
            return allActions;
        }

        //Upgrade (always possible)
        allActions.addAll(new UpgradeFactory().computeActionVariants(unit, gs));

        if (unit.isFinished())
            return allActions;

        //Attack
        allActions.addAll(new AttackFactory().computeActionVariants(unit, gs));

        //Capture
        allActions.addAll(new CaptureFactory().computeActionVariants(unit, gs));

        //Convert
        allActions.addAll(new ConvertFactory().computeActionVariants(unit, gs));

        //Disband
        allActions.addAll(new DisbandFactory().computeActionVariants(unit, gs));

        //Examine
        allActions.addAll(new ExamineFactory().computeActionVariants(unit, gs));

        //Heal Others
        allActions.addAll(new HealOthersFactory().computeActionVariants(unit, gs));

        //Make Veteran
        allActions.addAll(new MakeVeteranFactory().computeActionVariants(unit, gs));

        //Move
        allActions.addAll(new MoveFactory().computeActionVariants(unit, gs));

        //Recover
        allActions.addAll(new RecoverFactory().computeActionVariants(unit, gs));

        return allActions;
    }

}
