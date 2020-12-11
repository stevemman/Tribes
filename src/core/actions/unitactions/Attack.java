package core.actions.unitactions;

import core.Types;
import core.actions.Action;
import core.actors.units.Unit;
import core.game.GameState;

public class Attack extends UnitAction {
    private int targetId;

    public Attack(int unitId) {
        super(Types.ACTION.ATTACK);
        super.unitId = unitId;
    }

    public int getTargetId() {
        return targetId;
    }

    public void setTargetId(int targetId) {
        this.targetId = targetId;
    }

    @Override
    public boolean isFeasible(final GameState gs) {
        Unit target = (Unit) gs.getActor(this.targetId);
        Unit attacker = (Unit) gs.getActor(this.unitId);

        // Check if target is not null and that it can attack
        if (target == null || !attacker.canAttack() || attacker.getType() == Types.UNIT.MIND_BENDER)
            return false;

        return unitInRange(attacker, target, gs.getBoard());
    }

    @Override
    public Action copy() {
        Attack attack = new Attack(this.unitId);
        attack.setTargetId(this.targetId);
        return attack;
    }

    public String toString() {
        return "ATTACK by unit " + this.unitId + " to unit " + this.targetId;
    }
}
