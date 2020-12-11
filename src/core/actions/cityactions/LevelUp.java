package core.actions.cityactions;

import core.Types;
import core.Types.CITY_LEVEL_UP;
import core.actions.Action;
import core.actors.City;
import core.game.GameState;


public class LevelUp extends CityAction {

    private CITY_LEVEL_UP bonus;

    public LevelUp(int cityId) {
        super(Types.ACTION.LEVEL_UP);
        super.cityId = cityId;
    }

    public CITY_LEVEL_UP getBonus() {
        return bonus;
    }

    public void setBonus(CITY_LEVEL_UP bonus) {
        this.bonus = bonus;
    }

    @Override
    public boolean isFeasible(GameState gs) {
        City city = (City) gs.getActor(this.cityId);
        return city.canLevelUp() && bonus.validType(city.getLevel());
    }


    @Override
    public Action copy() {
        LevelUp lUp = new LevelUp(this.cityId);
        lUp.setBonus(this.bonus);
        lUp.setTargetPos(this.targetPos.copy());
        return lUp;
    }

    @Override
    public String toString() {
        return "LEVEL_UP by city " + this.cityId + " with bonus " + bonus.toString();
    }
}
