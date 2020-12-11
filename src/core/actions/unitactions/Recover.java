package core.actions.unitactions;

import core.Types;
import core.actions.Action;
import core.actors.units.Unit;
import core.game.GameState;

public class Recover extends UnitAction {
    public Recover(int unitId) {
        super(Types.ACTION.RECOVER);
        super.unitId = unitId;
    }

    @Override
    public boolean isFeasible(final GameState gs) {
        Unit unit = (Unit) gs.getActor(this.unitId);
        float currentHP = unit.getCurrentHP();
        return unit.isFresh() && currentHP < unit.getMaxHP() && currentHP > 0;
    }


    @Override
    public Action copy() {
        return new Recover(this.unitId);
    }

    public String toString() {
        return "RECOVER by unit " + this.unitId;
    }
}
