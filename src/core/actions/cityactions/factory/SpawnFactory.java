package core.actions.cityactions.factory;

import core.Types;
import core.actions.Action;
import core.actions.ActionFactory;
import core.actions.cityactions.Spawn;
import core.actors.Actor;
import core.actors.City;
import core.game.GameState;

import java.util.LinkedList;

public class SpawnFactory implements ActionFactory {

    @Override
    public LinkedList<Action> computeActionVariants(final Actor actor, final GameState gs) {
        City city = (City) actor;
        LinkedList<Action> actions = new LinkedList<>();

        for (Types.UNIT unit : Types.UNIT.values()) {
            Spawn newAction = new Spawn(city.getActorId());
            newAction.setUnitType(unit);
            newAction.setTargetPos(city.getPosition().copy());
            if (newAction.isFeasible(gs)) {
                actions.add(newAction);
            }
        }

        return actions;
    }

}
