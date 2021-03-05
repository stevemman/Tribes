package core;

public class TribesConfig {
    /* UNITS */

    // Warrior
    public static final int WARRIOR_ATTACK = 2;
    public static final int WARRIOR_DEFENCE = 2;
    public static final int WARRIOR_MOVEMENT = 1;
    public static final int WARRIOR_MAX_HP = 10;
    public static final int WARRIOR_RANGE = 1;
    public static final int WARRIOR_COST = 2;
    //Archer
    public static final int ARCHER_ATTACK = 2;
    public static final int ARCHER_DEFENCE = 1;
    public static final int ARCHER_MOVEMENT = 1;
    public static final int ARCHER_MAX_HP = 10;
    public static final int ARCHER_RANGE = 2;
    public static final int ARCHER_COST = 3;
    //Catapult
    public static final int CATAPULT_ATTACK = 4;
    public static final int CATAPULT_DEFENCE = 0;
    public static final int CATAPULT_MOVEMENT = 1;
    public static final int CATAPULT_MAX_HP = 10;
    public static final int CATAPULT_RANGE = 3;
    public static final int CATAPULT_COST = 8;
    //Swordsman
    public static final int SWORDMAN_ATTACK = 3;
    public static final int SWORDMAN_DEFENCE = 3;
    public static final int SWORDMAN_MOVEMENT = 1;
    public static final int SWORDMAN_MAX_HP = 15;
    public static final int SWORDMAN_RANGE = 1;
    public static final int SWORDMAN_COST = 5;
    //MindBender
    public static final int MINDBENDER_ATTACK = 0;
    public static final int MINDBENDER_DEFENCE = 1;
    public static final int MINDBENDER_MOVEMENT = 1;
    public static final int MINDBENDER_MAX_HP = 10;
    public static final int MINDBENDER_RANGE = 1;
    public static final int MINDBENDER_COST = 5;
    public static final int MINDBENDER_HEAL = 4;
    //Defender
    public static final int DEFENDER_ATTACK = 1;
    public static final int DEFENDER_DEFENCE = 3;
    public static final int DEFENDER_MOVEMENT = 1;
    public static final int DEFENDER_MAX_HP = 15;
    public static final int DEFENDER_RANGE = 1;
    public static final int DEFENDER_COST = 3;
    //Knight
    public static final int KNIGHT_ATTACK = 4;
    public static final int KNIGHT_DEFENCE = 1;
    public static final int KNIGHT_MOVEMENT = 3;
    public static final int KNIGHT_MAX_HP = 15;
    public static final int KNIGHT_RANGE = 1;
    public static final int KNIGHT_COST = 8;
    //Rider
    public static final int RIDER_ATTACK = 2;
    public static final int RIDER_DEFENCE = 1;
    public static final int RIDER_MOVEMENT = 2;
    public static final int RIDER_MAX_HP = 10;
    public static final int RIDER_RANGE = 1;
    public static final int RIDER_COST = 3;
    // Boat
    public static final int BOAT_ATTACK = 1;
    public static final int BOAT_DEFENCE = 1;
    public static final int BOAT_MOVEMENT = 2;
    public static final int BOAT_RANGE = 2;
    public static final int BOAT_COST = 0;
    // Ship
    public static final int SHIP_ATTACK = 2;
    public static final int SHIP_DEFENCE = 2;
    public static final int SHIP_MOVEMENT = 3;
    public static final int SHIP_RANGE = 2;
    public static final int SHIP_COST = 5;
    // Battleship
    public static final int BATTLESHIP_ATTACK = 4;
    public static final int BATTLESHIP_DEFENCE = 3;
    public static final int BATTLESHIP_MOVEMENT = 3;
    public static final int BATTLESHIP_RANGE = 2;
    public static final int BATTLESHIP_COST = 15;
    //Superunit
    public static final int SUPERUNIT_ATTACK = 5;
    public static final int SUPERUNIT_DEFENCE = 4;
    public static final int SUPERUNIT_MOVEMENT = 1;
    public static final int SUPERUNIT_MAX_HP = 40;
    public static final int SUPERUNIT_RANGE = 1;
    public static final int SUPERUNIT_COST = 10; //Useful for when unit is disbanded.
    //Explorer
    public static final int NUM_STEPS = 15;
    //General Unit constants
    public static final double ATTACK_MODIFIER = 4.5;
    public static final double DEFENCE_BONUS = 1.5;
    public static final double DEFENCE_IN_WALLS = 4.0;
    public static final int VETERAN_KILLS = 3;
    public static final int VETERAN_PLUS_HP = 5;
    public static final int RECOVER_PLUS_HP = 2;
    public static final int RECOVER_IN_BORDERS_PLUS_HP = 2;
    public static final int PORT_TRADE_DISTANCE = 4; //Count includes destination port.
    public static final int MONUMENT_POINTS = 400;
    public static final int EMPERORS_TOMB_STARS = 100;
    public static final int GATE_OF_POWER_KILLS = 10;
    public static final int GRAND_BAZAR_CITIES = 5;
    public static final int ALTAR_OF_PEACE_TURNS = 5;
    public static final int PARK_OF_FORTUNE_LEVEL = 5;
    public static final int TEMPLE_TURNS_TO_SCORE = 3;
    public static final int[] TEMPLE_POINTS = new int[]{100, 50, 50, 50, 150};
    // ROAD
    public static final int ROAD_COST = 2;
    // City
    public static final int CITY_LEVEL_UP_WORKSHOP_PROD = 1;
    public static final int CITY_LEVEL_UP_RESOURCES = 5;

    /* BUILDINGS */
    public static final int CITY_LEVEL_UP_POP_GROWTH = 3;
    public static final int CITY_LEVEL_UP_PARK = 250;
    public static final int CITY_BORDER_POINTS = 20;
    public static final int CITY_CENTRE_POINTS = 100;
    public static final int PROD_CAPITAL_BONUS = 1;
    public static final int EXPLORER_CLEAR_RANGE = 1;
    public static final int FIRST_CITY_CLEAR_RANGE = 2;
    public static final int NEW_CITY_CLEAR_RANGE = 1;
    public static final int CITY_EXPANSION_TILES = 1;
    public static final int POINTS_PER_POPULATION = 5;
    // Research
    public static final int TECH_BASE_COST = 4;
    public static final Types.TECHNOLOGY TECH_DISCOUNT = Types.TECHNOLOGY.PHILOSOPHY;
    public static final double TECH_DISCOUNT_VALUE = 0.2;
    public static final int TECH_TIER_POINTS = 100;
    /* TRIBES */
    public static final int INITIAL_STARS = 5;//1000;
    /* ACTIONS */
    public static final int CLEAR_FOREST_STAR = 2;
    public static final int GROW_FOREST_COST = 5;
    public static final int BURN_FOREST_COST = 5;
    public static final int CLEAR_VIEW_POINTS = 5;
    // MAP
    public static final int[] DEFAULT_MAP_SIZE = new int[]{-1, 11, 14, 16};
    static final int WARRIOR_POINTS = 10;
    static final int ARCHER_POINTS = 15;
    static final int CATAPULT_POINTS = 40;
    static final int SWORDMAN_POINTS = 25;
    static final int MINDBENDER_POINTS = 25;
    static final int DEFENDER_POINTS = 15;
    static final int KNIGHT_POINTS = 40;
    static final int RIDER_POINTS = 15;
    static final int BOAT_POINTS = 0;
    static final int SHIP_POINTS = 0;
    static final int BATTLESHIP_POINTS = 0;
    static final int SUPERUNIT_POINTS = 50;
    // Farm
    static final int FARM_COST = 5;
    static final int FARM_BONUS = 2;
    static final Types.RESOURCE FARM_RES_CONSTRAINT = Types.RESOURCE.CROPS;
    //WindMill
    static final int WIND_MILL_COST = 5;
    static final int WIND_MILL_BONUS = 1;
    // LumberHut
    static final int LUMBER_HUT_COST = 2;
    static final int LUMBER_HUT_BONUS = 1;
    // SawMill
    static final int SAW_MILL_COST = 5;
    static final int SAW_MILL_BONUS = 1;
    //Mine
    static final int MINE_COST = 5;
    static final int MINE_BONUS = 2;
    static final Types.RESOURCE MINE_RES_CONSTRAINT = Types.RESOURCE.ORE;
    // Forge
    static final int FORGE_COST = 5;
    static final int FORGE_BONUS = 2;
    // Port
    static final int PORT_COST = 10;
    static final int PORT_BONUS = 2;
    // Customs House
    static final int CUSTOMS_COST = 5;
    static final int CUSTOMS_BONUS = 2;
    //Monuments
    static final int MONUMENT_BONUS = 3;
    // Temple
    static final int TEMPLE_COST = 20;
    static final int TEMPLE_FOREST_COST = 15;
    static final int TEMPLE_BONUS = 1;
    //Resources
    static final int ANIMAL_COST = 2;
    static final int FISH_COST = 2;
    static final int WHALES_COST = 0;
    static final int FRUIT_COST = 2;
    static final int ANIMAL_POP = 1;
    static final int FISH_POP = 1;
    static final int WHALES_STARS = 10;
    static final int FRUIT_POP = 1;

}
