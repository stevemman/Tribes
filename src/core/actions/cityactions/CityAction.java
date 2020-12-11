package core.actions.cityactions;

import core.Types;
import core.actions.Action;
import core.game.GameState;
import utils.Vector2d;

public class CityAction extends Action {

    protected int cityId;
    protected Vector2d targetPos;
    public CityAction(Types.ACTION aType) {
        this.actionType = aType;
    }

    /**
     * Setters and getters
     */

    public int getCityId() {
        return cityId;
    }

    public void setCityId(int cityId) {
        this.cityId = cityId;
    }

    public Vector2d getTargetPos() {
        return targetPos;
    }

    public void setTargetPos(Vector2d pos) {
        targetPos = pos;
    }

    @Override
    public boolean isFeasible(GameState gs) {
        return false;
    }

    @Override
    public Action copy() {
        return null;
    }
}
