package core;

import core.actions.Action;
import core.actions.ActionCommand;
import core.actions.cityactions.command.*;
import core.actions.tribeactions.command.BuildRoadCommand;
import core.actions.tribeactions.command.EndTurnCommand;
import core.actions.tribeactions.command.ResearchTechCommand;
import core.actions.unitactions.command.*;
import core.actors.units.*;
import org.json.JSONObject;
import utils.ImageIO;
import utils.Vector2d;

import java.awt.*;
import java.util.*;

import static core.TribesConfig.*;
import static core.Types.BUILDING.MONUMENT_STATUS.UNAVAILABLE;
import static core.Types.TECHNOLOGY.*;
import static core.Types.TERRAIN.*;
import static core.Types.UNIT.RIDER;
import static core.Types.UNIT.WARRIOR;

public class Types {

    public enum TECHNOLOGY {
        CLIMBING(1, null),
        FISHING(1, null),
        HUNTING(1, null),
        ORGANIZATION(1, null),
        RIDING(1, null),
        ARCHERY(2, HUNTING),
        FARMING(2, ORGANIZATION),
        FORESTRY(2, HUNTING),
        FREE_SPIRIT(2, RIDING),
        MEDITATION(2, CLIMBING),
        MINING(2, CLIMBING),
        ROADS(2, RIDING),
        SAILING(2, FISHING),
        SHIELDS(2, ORGANIZATION),
        WHALING(2, FISHING),
        AQUATISM(3, WHALING),
        CHIVALRY(3, FREE_SPIRIT),
        CONSTRUCTION(3, FARMING),
        MATHEMATICS(3, FORESTRY),
        NAVIGATION(3, SAILING),
        SMITHERY(3, MINING),
        SPIRITUALISM(3, ARCHERY),
        TRADE(3, ROADS),
        PHILOSOPHY(3, MEDITATION);

        private final int tier;
        private final TECHNOLOGY parent;
        private ArrayList<TECHNOLOGY> children;

        TECHNOLOGY(int tier, TECHNOLOGY parent) {
            this.tier = tier;
            this.parent = parent;
        }

        public TECHNOLOGY getParentTech() {
            return this.parent;
        }

        public ArrayList<TECHNOLOGY> getChildTech() {
            if (children == null) {
                ArrayList<TECHNOLOGY> c = new ArrayList<>();
                for (TECHNOLOGY t : TECHNOLOGY.values()) {
                    if (t.getParentTech() == this) {
                        c.add(t);
                    }
                }
                children = c;
            }
            return children;
        }

        public int getCost(int numOfCities, TechnologyTree tt) {
            int cost = TECH_BASE_COST + this.tier * numOfCities;
            if (tt.isResearched(TECH_DISCOUNT)) {
                double disc_cost = cost * TECH_DISCOUNT_VALUE;
                cost = (int) disc_cost;
            }
            return cost;
        }

        public int getPoints() {
            return this.tier * TECH_TIER_POINTS;
        }

    }

    public enum TRIBE {
        XIN_XI(0, "Xin-Xi", CLIMBING, WARRIOR,
                new Color(251, 2, 7), new Color(253, 130, 123), new Color(174, 66, 48)),
        IMPERIUS(1, "Imperius", ORGANIZATION, WARRIOR,
                new Color(0, 0, 255), new Color(102, 125, 255), new Color(50, 73, 177)),
        BARDUR(2, "Bardur", HUNTING, WARRIOR,
                new Color(76, 76, 76), new Color(176, 178, 178), new Color(70, 58, 58)),
        OUMAJI(3, "Oumaji", RIDING, RIDER,
                new Color(255, 255, 10), new Color(242, 255, 100), new Color(146, 144, 0));

        private final int key;
        private final String name;
        private final TECHNOLOGY initialTech;
        private final UNIT startingUnit;
        private final Color color;
        private final Color color_light;
        private final Color color_dark;

        TRIBE(int numVal, String name, TECHNOLOGY initialTech, UNIT startingUnit, Color color, Color color_light, Color color_dark) {
            this.key = numVal;
            this.name = name;
            this.initialTech = initialTech;
            this.startingUnit = startingUnit;
            this.color = color;
            this.color_light = color_light;
            this.color_dark = color_dark;
        }

        public static TRIBE getTypeByKey(int key) {
            for (TRIBE t : Types.TRIBE.values()) {
                if (t.key == key)
                    return t;
            }
            return null;
        }

        public int getKey() {
            return key;
        }

        public String getName() {
            return name;
        }

        public TECHNOLOGY getInitialTech() {
            return initialTech;
        }

        public UNIT getStartingUnit() {
            return startingUnit;
        }

        public Color getColorDark() {
            return color_dark;
        }
    }

    /**
     * Defines the status of the turn for a unit
     */
    public enum TURN_STATUS {
        FRESH,
        MOVED,
        ATTACKED,
        MOVED_AND_ATTACKED,
        PUSHED,
        FINISHED
    }

    /**
     * Enum for resources. May need to be merged with TILES or somehow put in common
     */
    public enum RESOURCE {
        FISH(0, "img/resource/fish2.png", null, 'h', FISH_COST, FISH_POP, FISHING),
        FRUIT(1, "img/resource/fruit2.png", null, 'f', FRUIT_COST, FRUIT_POP, ORGANIZATION),
        ANIMAL(2, "img/resource/animal2.png", null, 'a', ANIMAL_COST, ANIMAL_POP, HUNTING),
        WHALES(3, "img/resource/whale2.png", "img/resource/whale3.png", 'w', WHALES_COST, WHALES_STARS, WHALING),
        ORE(5, "img/resource/ore2.png", null, 'o', 0, 0, MINING),
        CROPS(6, "img/resource/crops2.png", null, 'c', 0, 0, FARMING),
        RUINS(7, "img/resource/ruins2.png", null, 'r', 0, 0, null);

        private final int key;
        private final String imageFile;
        private final String secondaryImageFile;
        private final char mapChar;
        private final int cost;
        private final int bonus;
        private final TECHNOLOGY tech;

        RESOURCE(int numVal, String imageFile, String secondaryImageFile, char mapChar, int cost, int bonus, TECHNOLOGY t) {
            this.key = numVal;
            this.imageFile = imageFile;
            this.secondaryImageFile = secondaryImageFile;
            this.mapChar = mapChar;
            this.cost = cost;
            this.bonus = bonus;
            this.tech = t;
        }

        public static RESOURCE getType(char resourceChar) {
            for (RESOURCE r : Types.RESOURCE.values()) {
                if (r.mapChar == resourceChar)
                    return r;
            }
            return null;
        }

        public static RESOURCE getTypeByKey(int key) {
            for (RESOURCE t : RESOURCE.values()) {
                if (t.key == key)
                    return t;
            }
            return null;
        }

        public int getKey() {
            return key;
        }

        public Image getImage(TERRAIN t) {
            if (this == WHALES && t != null) {
                if (t == DEEP_WATER) {
                    return ImageIO.GetInstance().getImage(imageFile);
                } else {
                    return ImageIO.GetInstance().getImage(secondaryImageFile);
                }
            }
            return ImageIO.GetInstance().getImage(imageFile);
        }

        public int getCost() {
            return cost;
        }

        public int getBonus() {
            return bonus;
        }

        public char getMapChar() {
            return mapChar;
        }

        public TECHNOLOGY getTechnologyRequirement() {
            return tech;
        }
    }

    /**
     * Types of buildings that can be built by cities
     */
    public enum BUILDING {
        PORT(0, "img/building/dock2.png", PORT_COST, PORT_BONUS, SAILING, new HashSet<>(Collections.singletonList(SHALLOW_WATER))),
        MINE(1, "img/building/mine2.png", MINE_COST, MINE_BONUS, MINING, new HashSet<>(Collections.singletonList(MOUNTAIN))),
        FORGE(2, "img/building/forge2.png", FORGE_COST, FORGE_BONUS, SMITHERY, new HashSet<>(Collections.singletonList(PLAIN))),
        FARM(3, "img/building/farm2.png", FARM_COST, FARM_BONUS, FARMING, new HashSet<>(Collections.singletonList(PLAIN))),
        WINDMILL(4, "img/building/windmill2.png", WIND_MILL_COST, WIND_MILL_BONUS, CONSTRUCTION, new HashSet<>(Collections.singletonList(PLAIN))),
        CUSTOMS_HOUSE(5, "img/building/custom_house2.png", CUSTOMS_COST, CUSTOMS_BONUS, TRADE, new HashSet<>(Collections.singletonList(PLAIN))),
        LUMBER_HUT(6, "img/building/lumber_hut2.png", LUMBER_HUT_COST, LUMBER_HUT_BONUS, FORESTRY, new HashSet<>(Collections.singletonList(FOREST))),
        SAWMILL(7, "img/building/sawmill2.png", SAW_MILL_COST, SAW_MILL_BONUS, MATHEMATICS, new HashSet<>(Collections.singletonList(PLAIN))),
        TEMPLE(8, "img/building/temple2.png", TEMPLE_COST, TEMPLE_BONUS, FREE_SPIRIT, new HashSet<>(Collections.singletonList(PLAIN))),
        WATER_TEMPLE(9, "img/building/temple2.png", TEMPLE_COST, TEMPLE_BONUS, AQUATISM, new HashSet<>(Arrays.asList(SHALLOW_WATER, DEEP_WATER))),
        FOREST_TEMPLE(10, "img/building/temple2.png", TEMPLE_FOREST_COST, TEMPLE_BONUS, SPIRITUALISM, new HashSet<>(Collections.singletonList(FOREST))),
        MOUNTAIN_TEMPLE(11, "img/building/temple2.png", TEMPLE_COST, TEMPLE_BONUS, MEDITATION, new HashSet<>(Collections.singletonList(MOUNTAIN))),
        ALTAR_OF_PEACE(12, "img/building/monument2.png", 0, MONUMENT_BONUS, MEDITATION, new HashSet<>(Arrays.asList(SHALLOW_WATER, PLAIN))),
        EMPERORS_TOMB(13, "img/building/monument2.png", 0, MONUMENT_BONUS, TRADE, new HashSet<>(Arrays.asList(SHALLOW_WATER, PLAIN))),
        EYE_OF_GOD(14, "img/building/monument2.png", 0, MONUMENT_BONUS, NAVIGATION, new HashSet<>(Arrays.asList(SHALLOW_WATER, PLAIN))),
        GATE_OF_POWER(15, "img/building/monument2.png", 0, MONUMENT_BONUS, null, new HashSet<>(Arrays.asList(SHALLOW_WATER, PLAIN))),
        GRAND_BAZAR(16, "img/building/monument2.png", 0, MONUMENT_BONUS, ROADS, new HashSet<>(Arrays.asList(SHALLOW_WATER, PLAIN))),
        PARK_OF_FORTUNE(17, "img/building/monument2.png", 0, MONUMENT_BONUS, null, new HashSet<>(Arrays.asList(SHALLOW_WATER, PLAIN))),
        TOWER_OF_WISDOM(18, "img/building/monument2.png", 0, MONUMENT_BONUS, PHILOSOPHY, new HashSet<>(Arrays.asList(SHALLOW_WATER, PLAIN)));

        private final int key;
        private final String imageFile;
        private final TECHNOLOGY technologyRequirement;
        private final HashSet<TERRAIN> terrainRequirements;
        private final int cost;
        private final int bonus;
        BUILDING(int numVal, String imageFile, int cost, int bonus, TECHNOLOGY technologyRequirement, HashSet<TERRAIN> terrainRequirements) {
            this.key = numVal;
            this.cost = cost;
            this.bonus = bonus;
            this.imageFile = imageFile;
            this.technologyRequirement = technologyRequirement;
            this.terrainRequirements = terrainRequirements;
        }

        public static BUILDING stringToType(String type) {
            switch (type) {
                case "PORT":
                    return PORT;
                case "MINE":
                    return MINE;
                case "FORGE":
                    return FORGE;
                case "FARM":
                    return FARM;
                case "WINDMILL":
                    return WINDMILL;
                case "CUSTOMS_HOUSE":
                    return CUSTOMS_HOUSE;
                case "LUMBER_HUT":
                    return LUMBER_HUT;
                case "SAWMILL":
                    return SAWMILL;
                case "TEMPLE":
                    return TEMPLE;
                case "WATER_TEMPLE":
                    return WATER_TEMPLE;
                case "FOREST_TEMPLE":
                    return FOREST_TEMPLE;
                case "MOUNTAIN_TEMPLE":
                    return MOUNTAIN_TEMPLE;
                case "ALTAR_OF_PEACE":
                    return ALTAR_OF_PEACE;
                case "EMPERORS_TOMB":
                    return EMPERORS_TOMB;
                case "EYE_OF_GOD":
                    return EYE_OF_GOD;
                case "GATE_OF_POWER":
                    return GATE_OF_POWER;
                case "GRAND_BAZAR":
                    return GRAND_BAZAR;
                case "PARK_OF_FORTUNE":
                    return PARK_OF_FORTUNE;
                case "TOWER_OF_WISDOM":
                    return TOWER_OF_WISDOM;
            }
            return null;
        }

        public static HashMap<BUILDING, MONUMENT_STATUS> initMonuments() {
            HashMap<BUILDING, MONUMENT_STATUS> monuments = new HashMap<>();
            monuments.put(ALTAR_OF_PEACE, UNAVAILABLE);
            monuments.put(EMPERORS_TOMB, UNAVAILABLE);
            monuments.put(EYE_OF_GOD, UNAVAILABLE);
            monuments.put(GATE_OF_POWER, UNAVAILABLE);
            monuments.put(PARK_OF_FORTUNE, UNAVAILABLE);
            monuments.put(TOWER_OF_WISDOM, UNAVAILABLE);
            monuments.put(GRAND_BAZAR, UNAVAILABLE);
            return monuments;
        }

        public static HashMap<BUILDING, MONUMENT_STATUS> initMonuments(JSONObject JMonuments) {
            HashMap<BUILDING, MONUMENT_STATUS> monuments = new HashMap<>();
            Iterator<String> keys = JMonuments.keys();
            while (keys.hasNext()) {
                String key = keys.next();
                monuments.put(BUILDING.getTypeByKey(Integer.parseInt(key)), BUILDING.MONUMENT_STATUS.getTypeByKey(JMonuments.getInt(key)));
            }
            return monuments;
        }

        public static BUILDING getTypeByKey(int key) {
            for (BUILDING t : Types.BUILDING.values()) {
                if (t.key == key)
                    return t;
            }
            return null;
        }

        public TECHNOLOGY getTechnologyRequirement() {
            return technologyRequirement;
        }

        public HashSet<TERRAIN> getTerrainRequirements() {
            return terrainRequirements;
        }

        public int getKey() {
            return key;
        }

        public int getCost() {
            return cost;
        }

        public int getBonus() {
            return bonus;
        }

        public Image getImage() {
            return ImageIO.GetInstance().getImage(imageFile);
        }

        public Types.RESOURCE getResourceConstraint() {
            if (this == MINE) return MINE_RES_CONSTRAINT;
            if (this == FARM) return FARM_RES_CONSTRAINT;
            return null;
        }

        public Types.BUILDING getAdjacencyConstraint() {
            if (this == CUSTOMS_HOUSE) return PORT;
            if (this == WINDMILL) return FARM;
            if (this == FORGE) return MINE;
            if (this == SAWMILL) return LUMBER_HUT;
            return null;
        }

        public BUILDING getMatchingBuilding() {
            switch (this) {
                case PORT:
                    return CUSTOMS_HOUSE;
                case FARM:
                    return WINDMILL;
                case MINE:
                    return FORGE;
                case LUMBER_HUT:
                    return SAWMILL;
                case CUSTOMS_HOUSE:
                    return PORT;
                case WINDMILL:
                    return FARM;
                case FORGE:
                    return MINE;
                case SAWMILL:
                    return LUMBER_HUT;
            }
            return null;
        }

        public boolean isBase() {
            return this == FARM || this == MINE || this == LUMBER_HUT;
        }

        public boolean isMonument() {
            return this == ALTAR_OF_PEACE || this == EMPERORS_TOMB || this == EYE_OF_GOD ||
                    this == GATE_OF_POWER || this == PARK_OF_FORTUNE || this == TOWER_OF_WISDOM
                    || this == GRAND_BAZAR;
        }

        public boolean isTemple() {
            return this == TEMPLE || this == WATER_TEMPLE || this == MOUNTAIN_TEMPLE || this == FOREST_TEMPLE;
        }

        public enum MONUMENT_STATUS {
            UNAVAILABLE(0),
            AVAILABLE(1),
            BUILT(2);

            private final int key;

            MONUMENT_STATUS(int numVal) {
                this.key = numVal;
            }

            public static MONUMENT_STATUS getTypeByKey(int key) {
                for (MONUMENT_STATUS t : Types.BUILDING.MONUMENT_STATUS.values()) {
                    if (t.key == key)
                        return t;
                }
                return null;
            }

            public int getKey() {
                return key;
            }
        }
    }

    public enum EXAMINE_BONUS {
        SUPERUNIT(0, 0),
        RESEARCH(1, 0),
        POP_GROWTH(2, 3),
        EXPLORER(3, 0),
        RESOURCES(4, 10);

        private final int bonus;
        private final int key;

        EXAMINE_BONUS(int key, int bonus) {
            this.key = key;
            this.bonus = bonus;
        }

        public static EXAMINE_BONUS random(Random r) {
            EXAMINE_BONUS[] bonuses = EXAMINE_BONUS.values();
            return bonuses[r.nextInt(bonuses.length)];
        }

        public int getBonus() {
            return bonus;
        }
    }

    /**
     * Types of buildings that can be built by cities
     */
    public enum CITY_LEVEL_UP {
        WORKSHOP(2),
        EXPLORER(2),
        CITY_WALL(3),
        RESOURCES(3),
        POP_GROWTH(4),
        BORDER_GROWTH(4),
        PARK(5),
        SUPERUNIT(5);

        private final int level;

        CITY_LEVEL_UP(int level) {
            this.level = level;
        }

        public static LinkedList<CITY_LEVEL_UP> getActions(int curLevel) {
            LinkedList<CITY_LEVEL_UP> actions = new LinkedList<>();
            switch (curLevel) {
                case 1:
                    actions.add(WORKSHOP);
                    actions.add(EXPLORER);
                    break;
                case 2:
                    actions.add(CITY_WALL);
                    actions.add(RESOURCES);
                    break;

                case 3:
                    actions.add(POP_GROWTH);
                    actions.add(BORDER_GROWTH);
                    break;

                default:
                    actions.add(PARK);
                    actions.add(SUPERUNIT);
                    break;

            }
            return actions;
        }

        public int getLevel() {
            return level;
        }

        public boolean validType(int cityLevel) {
            if (cityLevel == 1 && (this == WORKSHOP || this == EXPLORER)) return true;
            if (cityLevel == 2 && (this == CITY_WALL || this == RESOURCES)) return true;
            if (cityLevel == 3 && (this == POP_GROWTH || this == BORDER_GROWTH)) return true;
            return cityLevel >= 4 && (this == PARK || this == SUPERUNIT);
        }

        public int getLevelUpPoints() {
            if (level == 1) {
                return 100;
            }
            return 50 - level * 5;
        }

        public boolean grantsMonument() {
            return this.level == PARK_OF_FORTUNE_LEVEL;
        }
    }


    /**
     * Types of actors
     */
    public enum UNIT {
        WARRIOR(0, "img/unit/warrior/", "img/weapons/melee/tile006.png", WARRIOR_COST, null, WARRIOR_POINTS), //+10
        RIDER(1, "img/unit/rider/", "img/weapons/melee/tile001.png", RIDER_COST, RIDING, RIDER_POINTS), //+15
        DEFENDER(2, "img/unit/defender/", "img/weapons/melee/tile002.png", DEFENDER_COST, SHIELDS, DEFENDER_POINTS), // +15
        SWORDMAN(3, "img/unit/swordsman/", "img/weapons/melee/tile000.png", SWORDMAN_COST, SMITHERY, SWORDMAN_POINTS), //+25
        ARCHER(4, "img/unit/archer/", "img/weapons/arrows/", ARCHER_COST, ARCHERY, ARCHER_POINTS),//+15
        CATAPULT(5, "img/unit/catapult/", "img/weapons/bombs/rock.png", CATAPULT_COST, MATHEMATICS, CATAPULT_POINTS), //+40
        KNIGHT(6, "img/unit/knight/", "img/weapons/melee/spear.png", KNIGHT_COST, CHIVALRY, KNIGHT_POINTS), //+40
        MIND_BENDER(7, "img/unit/mind_bender/", "img/weapons/effects/bender/", MINDBENDER_COST, PHILOSOPHY, MINDBENDER_POINTS), //+25
        BOAT(8, "img/unit/boat/", "img/weapons/arrows/boat.png", BOAT_COST, SAILING, BOAT_POINTS), //+0
        SHIP(9, "img/unit/ship/", "img/weapons/bombs/", SHIP_COST, SAILING, SHIP_POINTS),//+0
        BATTLESHIP(10, "img/unit/battleship/", "img/weapons/bombs/", BATTLESHIP_COST, NAVIGATION, BATTLESHIP_POINTS),//+0
        SUPERUNIT(11, "img/unit/superunit/", "img/weapons/melee/tile003.png", SUPERUNIT_COST, null, SUPERUNIT_POINTS); //+50

        private final int key;
        private final String imageFile;
        private final String weapon;
        private final int cost;
        private final TECHNOLOGY requirement;
        private final int points;

        UNIT(int numVal, String imageFile, String weaponFile, int cost, Types.TECHNOLOGY requirement, int points) {
            this.key = numVal;
            this.imageFile = imageFile;
            this.cost = cost;
            this.requirement = requirement;
            this.points = points;
            this.weapon = weaponFile;
        }

        public static UNIT stringToType(String type) {
            switch (type) {
                case "WARRIOR":
                    return WARRIOR;
                case "RIDER":
                    return RIDER;
                case "DEFENDER":
                    return DEFENDER;
                case "SWORDMAN":
                    return SWORDMAN;
                case "ARCHER":
                    return ARCHER;
                case "CATAPULT":
                    return CATAPULT;
                case "KNIGHT":
                    return KNIGHT;
                case "MIND_BENDER":
                    return MIND_BENDER;
                case "BOAT":
                    return BOAT;
                case "SHIP":
                    return SHIP;
                case "BATTLESHIP":
                    return BATTLESHIP;
                case "SUPERUNIT":
                    return SUPERUNIT;
            }
            return null;
        }

        public static Unit createUnit(Vector2d pos, int kills, boolean isVeteran, int ownerID, int tribeID, UNIT type) {
            switch (type) {
                case WARRIOR:
                    return new Warrior(pos, kills, isVeteran, ownerID, tribeID);
                case RIDER:
                    return new Rider(pos, kills, isVeteran, ownerID, tribeID);
                case DEFENDER:
                    return new Defender(pos, kills, isVeteran, ownerID, tribeID);
                case SWORDMAN:
                    return new Swordman(pos, kills, isVeteran, ownerID, tribeID);
                case ARCHER:
                    return new Archer(pos, kills, isVeteran, ownerID, tribeID);
                case CATAPULT:
                    return new Catapult(pos, kills, isVeteran, ownerID, tribeID);
                case KNIGHT:
                    return new Knight(pos, kills, isVeteran, ownerID, tribeID);
                case MIND_BENDER:
                    return new MindBender(pos, kills, isVeteran, ownerID, tribeID);
                case BOAT:
                    return new Boat(pos, kills, isVeteran, ownerID, tribeID);
                case SHIP:
                    return new Ship(pos, kills, isVeteran, ownerID, tribeID);
                case BATTLESHIP:
                    return new Battleship(pos, kills, isVeteran, ownerID, tribeID);
                case SUPERUNIT:
                    return new SuperUnit(pos, kills, isVeteran, ownerID, tribeID);

                default:
                    System.out.println("WARNING: TypescreateUnit(), type creation not implemented.");
            }
            return null;
        }

        public static ArrayList<UNIT> getSpawnableTypes() {
            ArrayList<UNIT> units = new ArrayList<>();
            for (UNIT u : UNIT.values()) {
                if (u.spawnable()) {
                    units.add(u);
                }
            }
            return units;
        }

        public static UNIT getTypeByKey(int key) {
            for (UNIT t : UNIT.values()) {
                if (t.key == key)
                    return t;
            }
            return null;
        }

        public Image getImage(int tribeKey) {
            return ImageIO.GetInstance().getImage(imageFile + tribeKey + ".png");
        }

        public String getImageFile() {
            return imageFile;
        }

        public Image getWeaponImage(int tribeKey) {
            if (this == SHIP || this == BATTLESHIP || this == ARCHER || this == MIND_BENDER) {
                return ImageIO.GetInstance().getImage(weapon + tribeKey + ".png");
            }
            return ImageIO.GetInstance().getImage(weapon);
        }

        public int getCost() {
            return cost;
        }

        public TECHNOLOGY getTechnologyRequirement() {
            return requirement;
        }

        public int getPoints() {
            return points;
        }

        public int getKey() {
            return key;
        }

        public boolean spawnable() {
            return !(this == BOAT || this == SHIP || this == BATTLESHIP || this == SUPERUNIT);
        }

        public boolean isWaterUnit() {
            return this == BOAT || this == SHIP || this == BATTLESHIP;
        }

        public boolean isRanged() {
            return this == BOAT || this == SHIP || this == BATTLESHIP || this == ARCHER || this == CATAPULT;
        }

        public boolean canFortify() {
            return this == WARRIOR || this == RIDER || this == ARCHER || this == DEFENDER || this == SWORDMAN || this == KNIGHT;
        }

    }


    /**
     * Defines the directions that game objects can have for movement.
     */
    public enum DIRECTIONS {
        NONE(0, 0),
        LEFT(-1, 0),
        RIGHT(1, 0),
        UP(0, -1),
        DOWN(0, 1);

        private final int x;
        private final int y;

        DIRECTIONS(int x, int y) {
            this.x = x;
            this.y = y;
        }

        public int x() {
            return x;
        }

        public int y() {
            return y;
        }
    }

    /**
     * Game Mode to be played
     */
    public enum GAME_MODE {
        CAPITALS(0),
        SCORE(1);

        private final int key;

        GAME_MODE(int numVal) {
            this.key = numVal;
        }

        public static GAME_MODE getTypeByKey(int key) {
            for (GAME_MODE t : GAME_MODE.values()) {
                if (t.key == key)
                    return t;
            }
            return null;
        }

        public int getKey() {
            return this.key;
        }

        public int getMaxTurns() {
            return (this == CAPITALS) ? Constants.MAX_TURNS_CAPITALS : Constants.MAX_TURNS;
        }
    }

    /**
     * Results of the game.
     */
    public enum RESULT {
        WIN(0),
        LOSS(1),
        INCOMPLETE(2);

        private final int key;

        RESULT(int numVal) {
            this.key = numVal;
        }

        public static RESULT getTypeByKey(int key) {
            for (RESULT t : RESULT.values()) {
                if (t.key == key)
                    return t;
            }
            return null;
        }

        public int getKey() {
            return this.key;
        }

        /**
         * Returns the colour that represents such victory condition for the GUI.
         *
         * @return colours of results.
         */
        public Color getColor() {
            if (key == WIN.key) return Color.green;
            if (key == LOSS.key) return Color.red;
            return null;
        }
    }

    /**
     * Different TERRAIN allowed in the game.
     * If more types are added, check methods in this enum to add them where they corresponds
     * (example: if new power-up is added, include it in getPowerUpTypes() so the board generator
     * can place them in the game).
     */
    public enum TERRAIN {

        //Types and IDs
        PLAIN(0, "img/terrain/plain.png", '.'),
        SHALLOW_WATER(1, "img/terrain/water.png", 's'),
        DEEP_WATER(2, "img/terrain/deepwater.png", 'd'),
        MOUNTAIN(3, "img/terrain/mountain3.png", 'm'),
        VILLAGE(4, "img/terrain/village2.png", 'v'),
        CITY(5, "img/terrain/city3.png", 'c'),
        FOREST(6, "img/terrain/forest2.png", 'f'),
        FOG(7, "img/fog.png", ' ');

        private final String imageFile;
        private final int key;
        private final char mapChar;

        TERRAIN(int numVal, String imageFile, char mapChar) {
            this.key = numVal;
            this.imageFile = imageFile;
            this.mapChar = mapChar;
        }

        public static TERRAIN getType(char terrainChar) {
            for (TERRAIN t : Types.TERRAIN.values()) {
                if (t.mapChar == terrainChar)
                    return t;
            }
            return null;
        }

        public static TERRAIN getTypeByKey(int key) {
            for (TERRAIN t : TERRAIN.values()) {
                if (t.key == key)
                    return t;
            }
            return null;
        }

        /**
         * Checks if two boards (arrays of tiletypes) are the same
         *
         * @param board1 one board to check
         * @param board2 the other board to check
         * @return true if they're equals.
         */
        public static boolean boardEquals(TERRAIN[][] board1, TERRAIN[][] board2) {

            if ((board1.length != board2.length) || (board1[0].length != board2[0].length))
                return false;

            for (int i = 0; i < board1.length; i++) {
                for (int i1 = 0; i1 < board1[i].length; i1++) {
                    TERRAIN b1i = board1[i][i1];
                    TERRAIN b2i = board2[i][i1];
                    if (b1i != null && b2i != null && b1i != b2i)
                        return false;
                }
            }
            return true;
        }

        public int getKey() {
            return key;
        }

        public char getMapChar() {
            return mapChar;
        }

        public Image getImage(String suffix) {
            if (suffix == null || suffix.equals("")) {
                return ImageIO.GetInstance().getImage(imageFile);
            }
            String[] splitPath = imageFile.split("\\.");
            return ImageIO.GetInstance().getImage(splitPath[0] + "-" + suffix + "." + splitPath[1]);
        }

        public boolean isWater() {
            return this == SHALLOW_WATER || this == DEEP_WATER;
        }
    }

    public enum ACTION {
        //city
        BUILD(null, null),
        BURN_FOREST(null, CHIVALRY),
        CLEAR_FOREST(null, FORESTRY),
        DESTROY(null, CONSTRUCTION),
        GROW_FOREST(null, SPIRITUALISM),
        LEVEL_UP(null, null),
        RESOURCE_GATHERING(null, null),
        SPAWN(null, null),

        //tribe
        BUILD_ROAD(null, ROADS),
        END_TURN(null, null),
        RESEARCH_TECH(null, null),

        //unit
        ATTACK("img/actions/attack.png", null),
        CAPTURE("img/actions/capture.png", null),
        CONVERT("img/actions/convert.png", null),
        DISBAND("img/actions/disband.png", FREE_SPIRIT),
        EXAMINE("img/actions/examine.png", null),
        HEAL_OTHERS("img/actions/heal2.png", null),
        MAKE_VETERAN(null, null),
        MOVE("img/actions/move.png", null),
        RECOVER(null, null),

        //others
        CLIMB_MOUNTAIN(null, CLIMBING),
        UPGRADE_BOAT("img/actions/upgrade.png", SAILING),
        UPGRADE_SHIP("img/actions/upgrade.png", NAVIGATION);

        private final String imgPath;
        private final TECHNOLOGY tech;  // Requires this technology to perform action

        ACTION(String imgPath, TECHNOLOGY t) {
            this.imgPath = imgPath;
            this.tech = t;
        }

        public static Image getImage(Action a) {
            return ImageIO.GetInstance().getImage(a.getActionType().imgPath);
        }

        public TECHNOLOGY getTechnologyRequirement() {
            return tech;
        }

        public ActionCommand getCommand() {
            switch (this) {
                //City actions
                case BUILD:
                    return new BuildCommand();
                case BURN_FOREST:
                    return new BurnForestCommand();
                case CLEAR_FOREST:
                    return new ClearForestCommand();
                case DESTROY:
                    return new DestroyCommand();
                case GROW_FOREST:
                    return new GrowForestCommand();
                case LEVEL_UP:
                    return new LevelUpCommand();
                case RESOURCE_GATHERING:
                    return new ResourceGatheringCommand();
                case SPAWN:
                    return new SpawnCommand();

                //Tribe actions
                case BUILD_ROAD:
                    return new BuildRoadCommand();
                case END_TURN:
                    return new EndTurnCommand();
                case RESEARCH_TECH:
                    return new ResearchTechCommand();

                //Unit actions
                case ATTACK:
                    return new AttackCommand();
                case CAPTURE:
                    return new CaptureCommand();
                case CONVERT:
                    return new ConvertCommand();
                case DISBAND:
                    return new DisbandCommand();
                case EXAMINE:
                    return new ExamineCommand();
                case HEAL_OTHERS:
                    return new HealOthersCommand();
                case MAKE_VETERAN:
                    return new MakeVeteranCommand();
                case MOVE:
                    return new MoveCommand();
                case RECOVER:
                    return new RecoverCommand();
                case UPGRADE_BOAT:
                case UPGRADE_SHIP:
                    return new UpgradeCommand();

            }
            System.out.println("ERROR: ActionCommand for action type " + this + " not implemented.");
            return null;
        }
    }
}
