package core.actions.tribeactions;

import core.Types;
import core.actions.Action;
import core.game.GameState;

public class TribeAction extends Action {

    protected int tribeId;

    TribeAction(Types.ACTION aType) {
        this.actionType = aType;
    }

    public int getTribeId() {
        return this.tribeId;
    }

    public void setTribeId(int tribeId) {
        this.tribeId = tribeId;
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