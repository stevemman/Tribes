package core.game;

import core.Constants;
import core.Types;
import core.actions.Action;
import core.actions.tribeactions.EndTurn;
import core.actors.Tribe;
import players.Agent;
import players.HumanAgent;
import utils.AIStats;
import utils.ElapsedCpuTimer;
import utils.GUI;
import utils.WindowInput;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;
import java.util.TreeSet;

import static core.Constants.*;
import static core.Types.ACTION.ATTACK;
import static core.Types.ACTION.END_TURN;

public class Game {

    // State of the game (objects, ticks, etc).
    private GameState gs;

    // GameState objects for players to make decisions
    private GameState[] gameStateObservations;

    // Seed for the game state.
    private long seed;

    //Random number generator for the game.
    private Random rnd;

    // List of players of the game
    private Agent[] players;

    //Number of players of the game.
    private int numPlayers;

    // Is the game paused from the GUI?
    private boolean paused, animationPaused;

    // AI stats for each player.
    private AIStats[] aiStats;

    /**
     * Constructor of the game
     */
    public Game() {
    }

    /**
     * Initializes the game. This method does the following:
     * Sets the players of the game, the number of players and their IDs
     * Initializes the array to hold the player game states.
     * Assigns the tribes that will play the game.
     * Creates the level reading it from the file 'filename'.
     * Resets the game so it's ready to start.
     * Turn order: by default, turns run following the order in the tribes array.
     *
     * @param players  Players of the game.
     * @param filename Name of the file with the level information.
     * @param seed     Seed for the game (used only for board generation)
     * @param gameMode Game Mode for this game.
     */
    public void init(ArrayList<Agent> players, String filename, long seed, Types.GAME_MODE gameMode) {

        //Initiate the bare bones of the main game classes
        this.seed = seed;
        this.rnd = new Random(seed);
        this.gs = new GameState(rnd, gameMode);

        this.gs.init(filename);
        initGameStructures(players, this.gs.getTribes().length);
        updateAssignedGameStates();
    }

    /**
     * Initializes the game. This method does the following:
     * Sets the players of the game, the number of players and their IDs
     * Initializes the array to hold the player game states.
     * Assigns the tribes that will play the game
     * Generates a new level using the seed levelgen_seed
     * Resets the game so it's ready to start.
     * Turn order: by default, turns run following the order in the tribes array.
     *
     * @param players       Players of the game.
     * @param levelgen_seed Seed for the level generator.
     * @param tribes        Array of tribe types to play with.
     * @param seed          Seed for the game (used only for board generation)
     * @param gameMode      Game Mode for this game.
     */
    public void init(ArrayList<Agent> players, long levelgen_seed, Types.TRIBE[] tribes, long seed, Types.GAME_MODE gameMode) {

        //Initiate the bare bones of the main game classes
        this.seed = seed;
        this.rnd = new Random(seed);
        this.gs = new GameState(rnd, gameMode);

        this.gs.init(levelgen_seed, tribes);
        initGameStructures(players, tribes);
        updateAssignedGameStates();
    }

    /**
     * Initializes the game from a savegame file
     *
     * @param players  Players who will play this game.
     * @param fileName savegame
     */
    public void init(ArrayList<Agent> players, String fileName) {

        GameLoader gameLoader = new GameLoader(fileName);
        this.seed = gameLoader.getSeed();
        this.rnd = new Random(seed);
        Tribe[] tribes = gameLoader.getTribes();
        this.gs = new GameState(rnd, gameLoader.getGame_mode(), tribes, gameLoader.getBoard(), gameLoader.getTick());
        this.gs.setGameIsOver(gameLoader.getGameIsOver());
        initGameStructures(players, tribes.length);
        updateAssignedGameStates();
    }

    /**
     * Initializes game structures depending on number of players and tribes
     *
     * @param players Players to play this game
     * @param nTribes number of tribes the game is set up to start with. Should be the same as players.size().
     */
    private void initGameStructures(ArrayList<Agent> players, int nTribes) {
        if (players.size() != nTribes) {
            System.out.println("ERROR: Number of tribes must _equal_ the number of players. There are " +
                    players.size() + " players for " + nTribes + " tribes in this level.");
            System.exit(-1);
        }

        //Create the players and agents to control them
        numPlayers = players.size();
        this.players = new Agent[numPlayers];
        this.aiStats = new AIStats[numPlayers];

        ArrayList<Integer> allIds = new ArrayList<>();
        for (int i = 0; i < numPlayers; ++i)
            allIds.add(i);

        for (int i = 0; i < numPlayers; ++i) {
            this.players[i] = players.get(i);
            this.players[i].setPlayerIDs(i, allIds);
            this.aiStats[i] = new AIStats(i);
        }

        this.gameStateObservations = new GameState[numPlayers];
    }


    /**
     * Initializes game structures depending on number of players and tribes
     *
     * @param players Players to play this game
     * @param tribes  Array of tribe types to play with.
     */
    private void initGameStructures(ArrayList<Agent> players, Types.TRIBE[] tribes) {
        int nTribes = tribes.length;
        if (players.size() != nTribes) {
            System.out.println("ERROR: Number of tribes must _equal_ the number of players. There are " +
                    players.size() + " players for " + nTribes + " tribes in this level.");
            System.exit(-1);
        }

        //Create the players and agents to control them
        numPlayers = players.size();
        this.players = new Agent[numPlayers];
        this.aiStats = new AIStats[numPlayers];

        Tribe[] tribeObjects = gs.getTribes();

        for (int tribeIdx = 0; tribeIdx < tribeObjects.length; ++tribeIdx) {
            Tribe thisTribe = tribeObjects[tribeIdx];
            core.Types.TRIBE tribeType = thisTribe.getType();

            ArrayList<Integer> allIds = new ArrayList<>();
            int indexInTypes = -1;
            for (int i = 0; i < tribes.length; ++i) {
                allIds.add(i);
                if (tribes[i] == tribeType)
                    indexInTypes = i;
            }

            this.players[tribeIdx] = players.get(indexInTypes);
            this.players[tribeIdx].setPlayerIDs(tribeIdx, allIds);
            this.aiStats[tribeIdx] = new AIStats(tribeIdx);
        }
        this.gameStateObservations = new GameState[numPlayers];
    }

    /**
     * Runs a game once. Receives frame and window input. If any is null, forces a run with no visuals.
     *
     * @param frame window to draw the game
     * @param wi    input for the window.
     */
    public void run(GUI frame, WindowInput wi) {
        if (frame == null || wi == null)
            VISUALS = false;

        boolean firstEnd = true;

        while (frame == null || !frame.isClosed()) {
//            System.out.println("Frame closed: " + frame.isClosed());
            // Loop while window is still open, even if the game ended.
            // If not playing with visuals, loop is broken when game's ended.

            boolean gameOver = gameOver();
            // Check end of game
            if (firstEnd && gameOver) {
                terminate();

                firstEnd = false;

                printGameResults();
                if (VERBOSE) {
                    TreeSet<TribeResult> ranking = getCurrentRanking();
                    for (TribeResult tr : ranking) {
                        int idx = tr.getId();
                        AIStats ais = aiStats[idx];
                        ais.print();
                    }
                }

                if (!VISUALS || frame == null) {
                    // The game has ended, end the loop if we're running without visuals.
                    break;
                }
            }
            if (!gameOver) {
                tick(frame);
            } else {
                frame.update(getGameState(-1), null);
            }
        }
    }

    /**
     * Ticks the game forward. Asks agents for actions and applies returned actions to obtain the next game state.
     *
     * @param frame GUI of the game
     */
    private void tick(GUI frame) {

//        System.out.println("Tick: " + gs.getTick());
        Tribe[] tribes = gs.getTribes();
        for (int i = 0; i < numPlayers; i++) {
            Tribe tribe = tribes[i];

            if (tribe.getWinner() != Types.RESULT.INCOMPLETE)
                continue; //We don't do anything for tribes that have already finished.


            //play the full turn for this player
            processTurn(i, tribe, frame);

            // Save Game
            if (Constants.WRITE_SAVEGAMES)
                GameSaver.writeTurnFile(gs, getBoard(), seed);

            //it may be that this player won the game, no more playing.
            if (gameOver()) {
                return;
            }

            // Check if game should be paused automatically after this turn
            if (VISUALS && frame != null && frame.pauseAfterTurn()) {
                paused = true;
                frame.setPauseAfterTurn(false);
            }
        }

        // Check if game should be paused automatically after this tick
        if (VISUALS && frame != null && frame.pauseAfterTick()) {
            paused = true;
            frame.setPauseAfterTick(false);
        }

        //All turns passed, time to increase the tick.
        gs.incTick();
    }

    /**
     * Process a turn for a given player. It queries the player for an action until no more
     * actions are available or the player returns a EndTurnAction action.
     *
     * @param playerID ID of the player whose turn is being processed.
     * @param tribe    tribe that corresponds to this player.
     */
    private void processTurn(int playerID, Tribe tribe, GUI frame) {
        //Init the turn for this tribe (stars, unit reset, etc).
        gs.initTurn(tribe);

        //Compute the initial player actions and assign the game states.
        gs.computePlayerActions(tribe);
        updateAssignedGameStates();

        //Take the player for this turn
        Agent ag = players[playerID];
        boolean isHumanPlayer = ag instanceof HumanAgent;

        //start the timer to the max duration
        ElapsedCpuTimer ect = new ElapsedCpuTimer();
        ect.setMaxTimeMillis(TURN_TIME_MILLIS);

        // Keep track of time remaining for turn thinking
        long remainingECT = TURN_TIME_MILLIS;

        boolean continueTurn = true;
        int curActionCounter = 0;

        // Timer for action execution, delay introduced from GUI. Another delay is added at the end of the turn to
        // make sure all updates are executed and displayed to humans.
        ElapsedCpuTimer actionDelayTimer = null;
        ElapsedCpuTimer endTurnDelay = null;
        if (VISUALS && frame != null) {
            actionDelayTimer = new ElapsedCpuTimer();
            actionDelayTimer.setMaxTimeMillis(FRAME_DELAY);
        }

        while (frame == null || !frame.isClosed()) {
            // Keep track of action played in this loop, null if no action.
            Action action = null;

            // Check GUI end of turn timer
            if (endTurnDelay != null && endTurnDelay.remainingTimeMillis() <= 0) break;

            if (!paused && !animationPaused) {
                // Action request and execution if turn should be continued
                if (continueTurn) {
                    //noinspection ConstantConditions
                    if ((!VISUALS || frame == null) || actionDelayTimer.remainingTimeMillis() <= 0 || isHumanPlayer) {
                        // Get one action from the player
                        ect.setMaxTimeMillis(remainingECT);  // Reset timer ignoring all other timers or updates
                        action = ag.act(gameStateObservations[playerID], ect);
                        remainingECT = ect.remainingTimeMillis(); // Note down the remaining time to use it for the next iteration

                        if (!isHumanPlayer)
                            updateBranchingFactor(aiStats[playerID], gs.getTick(), gameStateObservations[playerID]);


                        curActionCounter++;

                        if (actionDelayTimer != null) {  // Reset action delay timer for next action request
                            actionDelayTimer = new ElapsedCpuTimer();
                            actionDelayTimer.setMaxTimeMillis(FRAME_DELAY);
                        }

                        // Continue this turn if there are still available actions and end turn was not requested.
                        // If the agent is human, let him play for now.
                        continueTurn = !gs.isTurnEnding();
                        if (!isHumanPlayer) {
                            ect.setMaxTimeMillis(remainingECT);
                            boolean timeOut = TURN_LIMITED && ect.exceededMaxTime();
                            continueTurn &= gs.existAvailableActions(tribe) && !timeOut;
                        }
                    }
                } else if (endTurnDelay == null) {
                    // If turn should be ending (and we've not already triggered end turn), the action is automatically EndTurn
                    action = new EndTurn(gs.getActiveTribeID());
                }
            }

            // Update GUI after every iteration
            if (VISUALS && frame != null) {
                boolean showAllBoard = Constants.GUI_FORCE_FULL_OBS || Constants.PLAY_WITH_FULL_OBS;

                if (showAllBoard) frame.update(getGameState(-1), action);  // Full Obs
                else frame.update(gameStateObservations[gs.getActiveTribeID()], action);        // Partial Obs

                // Turn should be ending, start timer for delay of next action and show all updates
                if (action != null && action.getActionType() == END_TURN) {
                    if (isHumanPlayer) break;
                    endTurnDelay = new ElapsedCpuTimer();
                    endTurnDelay.setMaxTimeMillis(FRAME_DELAY);
                }

//                try {
//                    Thread.sleep(10);
//                } catch (InterruptedException e) {
//                    e.printStackTrace();
//                }
            } else if (action != null && action.getActionType() == END_TURN) { // If no visuals and we should end the turn, just break out of loop here
                break;
            }

            if (action != null && !VISUALS || frame != null && (action != null && !(action.getActionType() == ATTACK) ||
                    (action = frame.getAnimatedAction()) != null)) {
                // Play the action in the game and update the available actions list and observations
                // Some actions are animated, the condition above checks if this animation is finished and retrieves
                // the action after all the GUI updates.
                gs.next(action);
                gs.computePlayerActions(tribe);
                updateAssignedGameStates();
            }

            if (gameOver()) {
                break;
            }
        }

        // Ends the turn for this tribe (units that didn't move heal).
        gs.endTurn(tribe);
    }

    /**
     * Prints the results of the game.
     */
    private void printGameResults() {
        Types.RESULT[] results = getWinnerStatus();
        int[] sc = getScores();
        Tribe[] tribes = gs.getBoard().getTribes();

        TreeSet<TribeResult> ranking = gs.getCurrentRanking();
        System.out.println(gs.getTick() + "; Game Results: ");
        int rank = 1;
        for (TribeResult tr : ranking) {
            int tribeId = tr.getId();
            Agent ag = players[tribeId];
            String[] agentChunks = ag.getClass().toString().split("\\.");
            String agentName = agentChunks[agentChunks.length - 1];

            System.out.print(" #" + rank + ": Tribe " + tribes[tribeId].getType() + " (" + agentName + "): " + results[tribeId] + ", " + sc[tribeId] + " points;");
            System.out.println(" #tech: " + tr.getNumTechsResearched() + ", #cities: " + tr.getNumCities() + ", production: " + tr.getProduction());
            rank++;
        }
    }


    /**
     * This method call all agents' end-of-game method for post-processing.
     * Agents receive their final game state and reward
     */
    @SuppressWarnings("UnusedReturnValue")
    private void terminate() {

        Tribe[] tribes = gs.getTribes();
        for (int i = 0; i < numPlayers; i++) {
            Agent ag = players[i];
            ag.result(gs.copy(), tribes[i].getScore());
        }
    }

    private void updateBranchingFactor(AIStats aiStats, int turn, GameState currentGameState) {
        ArrayList<Integer> actionCounts = new ArrayList<>();

        HashMap<Integer, ArrayList<Action>> cityActions = currentGameState.getCityActions();
        for (Integer id : cityActions.keySet()) {
            actionCounts.add(cityActions.get(id).size());
        }

        HashMap<Integer, ArrayList<Action>> unitAcions = currentGameState.getUnitActions();
        for (Integer id : unitAcions.keySet()) {
            actionCounts.add(unitAcions.get(id).size());
        }

        actionCounts.add(currentGameState.getTribeActions().size());

        aiStats.addBranchingFactor(turn, actionCounts);
        aiStats.addActionsPerStep(turn, gs.getAllAvailableActions().size());
    }

    /**
     * Returns the winning status of all players.
     *
     * @return the winning status of all players.
     */
    public Types.RESULT[] getWinnerStatus() {
        //Build the results array
        Tribe[] tribes = gs.getTribes();
        Types.RESULT[] results = new Types.RESULT[numPlayers];
        for (int i = 0; i < numPlayers; i++) {
            Tribe tribe = tribes[i];
            results[i] = tribe.getWinner();
        }
        return results;
    }

    /**
     * Returns the current scores of all players.
     *
     * @return the current scores of all players.
     */
    public int[] getScores() {
        //Build the results array
        Tribe[] tribes = gs.getTribes();
        int[] scores = new int[numPlayers];
        for (int i = 0; i < numPlayers; i++) {
            scores[i] = tribes[i].getScore();
        }
        return scores;
    }

    /**
     * Updates the state observations for all players with copies of the
     * current game state, adapted for PO.
     */
    private void updateAssignedGameStates() {

        //TODO: Probably we don't need to do this for all players, just the active one.
        for (int i = 0; i < numPlayers; i++) {
            gameStateObservations[i] = getGameState(i);
        }
    }

    /**
     * Returns the game state as seen for the player with the index playerIdx. This game state
     * includes only the observations that are visible if partial observability is enabled.
     *
     * @param playerIdx index of the player for which the game state is generated.
     * @return the game state.
     */
    private GameState getGameState(int playerIdx) {
        return gs.copy(playerIdx);
    }

    /**
     * Returns the game board.
     *
     * @return the game board.
     */
    public Board getBoard() {
        return gs.getBoard();
    }

    public Agent[] getPlayers() {
        return players;
    }

    /**
     * Method to identify the end of the game. If the game is over, the winner is decided.
     * The winner of a game is determined by TribesConfig.GAME_MODE and TribesConfig.MAX_TURNS
     *
     * @return true if the game has ended, false otherwise.
     */
    boolean gameOver() {
        return gs.gameOver();
    }

    public void setAnimationPaused(boolean p) {
        animationPaused = p;
    }

    public boolean isPaused() {
        return paused;
    }

    public void setPaused(boolean p) {
        paused = p;
    }

    public TreeSet<TribeResult> getCurrentRanking() {
        return gs.getCurrentRanking();
    }
}
