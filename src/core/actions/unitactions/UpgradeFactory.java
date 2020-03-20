package core.actions.unitactions;

import core.actions.Action;
import core.actions.ActionFactory;
import core.actors.Actor;
import core.actors.units.Unit;
import core.game.GameState;

import java.util.LinkedList;

public class UpgradeFactory implements ActionFactory {

    @Override
    public LinkedList<Action> computeActionVariants(final Actor actor, final GameState gs) {
        Unit unit = (Unit) actor;
        LinkedList<Action> upgradeActions = new LinkedList<>();
        Upgrade action = new Upgrade(unit.getActorId());

        if(action.isFeasible(gs)){
            upgradeActions.add(action);
        }
        return upgradeActions;
    }

}
