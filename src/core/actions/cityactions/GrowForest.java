package core.actions.cityactions;

import core.TribesConfig;
import core.Types;
import core.actions.Action;
import core.actors.City;
import core.actors.Tribe;
import core.game.Board;
import core.game.GameState;

public class GrowForest extends CityAction {

    public GrowForest(int cityId) {
        super(Types.ACTION.GROW_FOREST);
        super.cityId = cityId;
    }


    @Override
    public boolean isFeasible(final GameState gs) {
        City city = (City) gs.getActor(this.cityId);
        Board b = gs.getBoard();
        if (b.getTerrainAt(targetPos.x, targetPos.y) != Types.TERRAIN.PLAIN) return false;
        if (b.getCityIdAt(targetPos.x, targetPos.y) != city.getActorId()) return false;

        Tribe t = gs.getTribe(city.getTribeId());
        if (t.getStars() < TribesConfig.GROW_FOREST_COST) return false;
        return t.getTechTree().isResearched(Types.TECHNOLOGY.SPIRITUALISM);
    }

    @Override
    public Action copy() {
        GrowForest grow = new GrowForest(this.cityId);
        grow.setTargetPos(this.targetPos.copy());
        return grow;
    }

    public String toString() {
        return "GROW_FOREST by city " + this.cityId + " at " + targetPos;
    }
}
