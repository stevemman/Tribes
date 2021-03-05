package core.actors;

import utils.Vector2d;

public abstract class Actor {

    /**
     * Id of the tribe this actor belongs to.
     */
    protected int tribeId = -1;
    /**
     * Position of this actor in the board
     */
    protected Vector2d position;
    /**
     * Unique ID of this actor. It won't repeat through the game for any other.
     */
    int actorId = -1;

    /**
     * Method to provide a copy of this actor.
     *
     * @param hideInfo indicates if information of this actor should be copied or hidden for
     *                 partial observability.
     * @return new copy fo the Actor
     */
    public abstract Actor copy(boolean hideInfo);

    public int getActorId() {
        return actorId;
    }

    public void setActorId(int actorID) {
        this.actorId = actorID;
    }

    public int getTribeId() {
        return tribeId;
    }

    public void setTribeId(int tribeID) {
        this.tribeId = tribeID;
    }

    public void setPosition(int x, int y) {
        position = new Vector2d(x, y);
    }

    public Vector2d getPosition() {
        return position;
    }

}
