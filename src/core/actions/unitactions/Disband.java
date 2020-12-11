package core.actions.unitactions;

import core.TechnologyTree;
import core.Types;
import core.actions.Action;
import core.actors.units.Unit;
import core.game.GameState;

public class Disband extends UnitAction {
    public Disband(int unitId) {
        super(Types.ACTION.DISBAND);
        super.unitId = unitId;
    }

    @Override
    public boolean isFeasible(final GameState gs) {
        Unit unit = (Unit) gs.getActor(this.unitId);
        TechnologyTree tt = gs.getTribe(unit.getTribeId()).getTechTree();
        return unit.isFresh() && tt.isResearched(Types.TECHNOLOGY.FREE_SPIRIT);
    }

    @Override
    public Action copy() {
        return new Disband(this.unitId);
    }

    @Override
    public String toString() {
        return "DISBAND of unit " + this.unitId;
    }
}
