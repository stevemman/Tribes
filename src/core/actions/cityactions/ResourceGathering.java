package core.actions.cityactions;

import core.Types;
import core.actions.Action;
import core.actors.City;
import core.actors.Tribe;
import core.game.Board;
import core.game.GameState;

public class ResourceGathering extends CityAction {
    private Types.RESOURCE resource;

    public ResourceGathering(int cityId) {
        super(Types.ACTION.RESOURCE_GATHERING);
        super.cityId = cityId;
    }

    public Types.RESOURCE getResource() {
        return resource;
    }

    public void setResource(Types.RESOURCE resource) {
        this.resource = resource;
    }

    @Override
    public boolean isFeasible(final GameState gs) {
        City city = (City) gs.getActor(this.cityId);
        Board b = gs.getBoard();
        Tribe t = b.getTribe(city.getTribeId());

        // Check if resource can be gathered
        if (b.getResourceAt(targetPos.x, targetPos.y) == this.resource && t.getStars() >= this.resource.getCost()) {
            switch (this.resource) {
                case ANIMAL:
                    return t.getTechTree().isResearched(Types.TECHNOLOGY.HUNTING);
                case FISH:
                    return t.getTechTree().isResearched(Types.TECHNOLOGY.FISHING);
                case WHALES:
                    return t.getTechTree().isResearched(Types.TECHNOLOGY.WHALING);
                case FRUIT:
                    return t.getTechTree().isResearched(Types.TECHNOLOGY.ORGANIZATION);
            }
        }
        return false;
    }

    @Override
    public Action copy() {
        ResourceGathering res = new ResourceGathering(this.cityId);
        res.setResource(this.resource);
        res.setTargetPos(targetPos.copy());
        return res;
    }

    public String toString() {
        return "RESOURCE_GATHERED by city " + this.cityId + " : " + resource.toString();
    }
}
