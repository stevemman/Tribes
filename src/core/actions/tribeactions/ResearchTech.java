package core.actions.tribeactions;

import core.Types;
import core.actions.Action;
import core.actors.Tribe;
import core.game.GameState;


public class ResearchTech extends TribeAction {

    private Types.TECHNOLOGY tech;

    public ResearchTech(int tribeId) {
        super(Types.ACTION.RESEARCH_TECH);
        this.tribeId = tribeId;
    }

    public Types.TECHNOLOGY getTech() {
        return this.tech;
    }

    public void setTech(Types.TECHNOLOGY tech) {
        this.tech = tech;
    }

    @Override
    public boolean isFeasible(final GameState gs) {
        Tribe tribe = gs.getTribe(tribeId);

        if (tech == null)
            return false;

        if (tribe.getStars() >= tech.getCost(tribe.getNumCities(), tribe.getTechTree()))
            return tribe.getTechTree().isResearchable(this.tech);
        return false;
    }


    @Override
    public Action copy() {
        ResearchTech resTech = new ResearchTech(this.tribeId);
        resTech.setTech(this.tech);
        return resTech;
    }

    public String toString() {
        return "RESEARCH_TECH by tribe " + this.tribeId + " : " + tech.toString();
    }
}
