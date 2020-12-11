package utils;

import java.math.BigInteger;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;

public class AIStats {
    public int MAX = 0;
    public int MEAN = 1;
    public int FIRST = 2;
    public int REPORT = MAX;
    //Action branching factor (per tick)
    private final HashMap<Integer, BigInteger> branchingFactorMult;
    private final HashMap<Integer, ArrayList<BigInteger>> branchingFactorAll;
    private final HashMap<Integer, ArrayList<Integer>> actionsPerStep;
    private final HashMap<Integer, ArrayList<Integer>> actionsPerStepArray;
    private final int playerId;

    public AIStats(int playerId) {
        this.playerId = playerId;
        branchingFactorMult = new HashMap<>();
        branchingFactorAll = new HashMap<>();
        actionsPerStep = new HashMap<>();
        actionsPerStepArray = new HashMap<>();
    }

    /**
     * Adds a branching factor
     *
     * @param turn   turn for this branching factor.
     * @param values number of available actions at this point *per unit*
     */
    public void addBranchingFactor(int turn, ArrayList<Integer> values) {
        BigInteger bInt = BigInteger.valueOf(1);
        for (Integer val : values) {
            if (val == 0) {
                val = 1;
            }

            bInt = bInt.multiply(BigInteger.valueOf(val));
        }

        if (!branchingFactorMult.containsKey(turn)) {
            branchingFactorMult.put(turn, bInt);

            ArrayList<BigInteger> newList = new ArrayList<>();
            newList.add(bInt);
            branchingFactorAll.put(turn, newList);
        } else {
            BigInteger prevValue = branchingFactorMult.get(turn);
            BigInteger newValue = prevValue.multiply(bInt);
            branchingFactorMult.put(turn, newValue);

            ArrayList<BigInteger> list = branchingFactorAll.get(turn);
            list.add(bInt);
        }
    }

    public void addActionsPerStep(int turn, int n_actions) {
        if (!actionsPerStep.containsKey(turn)) {
            ArrayList<Integer> newList = new ArrayList<>();
            newList.add(n_actions);
            actionsPerStep.put(turn, newList);

            ArrayList<Integer> newList2 = new ArrayList<>();
            newList2.add(n_actions);
            actionsPerStepArray.put(turn, newList2);
        } else {
            ArrayList<Integer> listAvg = actionsPerStepArray.get(turn);
            listAvg.add(n_actions);
        }
    }

    public void print() {
        NumberFormat formatter = new DecimalFormat("0.######E0", DecimalFormatSymbols.getInstance(Locale.ROOT));
//
//        System.out.print("Branching Factor (Turn): " + playerId + ", "  + branchingFactorMult.size() + ", ");
//        for(Integer it : branchingFactorMult.keySet())
//        {
////            System.out.print(branchingFactorMult.get(it) + " ");
//            BigInteger bi = branchingFactorMult.get(it);
//            String valStr = formatter.format(bi);
//            System.out.print(valStr + " ");
//        }
//        System.out.println();

//        System.out.print("Branching Factor (" + REPORT + "): " + playerId + ", "  + branchingFactorMult.size() + ", ");
//        for(Integer it : branchingFactorAll.keySet())
//        {
//            StatSummary ss = new StatSummary();
//            BigInteger first = BigInteger.valueOf(-1);
//            for(BigInteger val : branchingFactorAll.get(it)) {
//                ss.add(val);
//                if(first.intValue()==-1)
//                    first = val;
//            }
////            System.out.print(ss.mean() + " (" + ss.stdErr() + ") ");
//
//            StatSummary ss2 = new StatSummary();
//            for(BigInteger val : branchingFactorSum.get(it)) {
//                ss2.add(val);
//            }
//
//
//            double toPrint = -1;
//            if(REPORT == MEAN)          toPrint = ss.mean();
//            else if(REPORT == MAX)      toPrint = ss.max();
//            else if(REPORT == FIRST)    toPrint = first.doubleValue();
//
//            String valStr = formatter.format(toPrint);
//            System.out.print(valStr + " ");
////            System.out.printf("%.2f ", ss.mean());
//        }
//        System.out.println();

        System.out.print("Actions Per Step (" + REPORT + "): " + playerId + ", " + branchingFactorMult.size() + ", ");
        for (Integer it : actionsPerStep.keySet()) {
            StatSummary ss2 = new StatSummary();
            for (Integer val : actionsPerStep.get(it)) {
                ss2.add(val);
            }


            double toPrint = ss2.mean();
//            String valStr = formatter.format(toPrint);
            System.out.print(toPrint + " ");
//            System.out.printf("%.2f ", ss.mean());
        }
        System.out.println();

        System.out.print("Actions Per Step Avg (" + REPORT + "): " + playerId + ", " + branchingFactorMult.size() + ", ");
        for (Integer it : actionsPerStepArray.keySet()) {
            StatSummary ss2 = new StatSummary();
            for (Integer val : actionsPerStepArray.get(it)) {
                ss2.add(val);
            }


            double toPrint = ss2.mean();
//            String valStr = formatter.format(toPrint);
            System.out.print(toPrint + " ");
//            System.out.printf("%.2f ", ss.mean());
        }
        System.out.println();

        System.out.print("Branching factor mult (" + REPORT + "): " + playerId + ", " + branchingFactorMult.size() + ", ");
        for (Integer it : actionsPerStepArray.keySet()) {
            BigInteger bInt = BigInteger.valueOf(1);
            for (Integer val : actionsPerStepArray.get(it)) {
                if (val > 0) {
                    BigInteger other = BigInteger.valueOf(val);
                    bInt = bInt.multiply(other);
                }
            }


//            double toPrint = ss2.mean();
            String valStr = formatter.format(bInt);
            System.out.print(valStr + " ");
//            System.out.printf("%.2f ", ss.mean());
        }
        System.out.println();

        System.out.print("#moves in turn: " + playerId + ", " + branchingFactorMult.size() + ", ");
        for (Integer it : branchingFactorAll.keySet()) {
            StatSummary ss = new StatSummary();
            for (BigInteger val : branchingFactorAll.get(it))
                ss.add(val);
//            System.out.print(ss.mean() + " (" + ss.stdErr() + ") ");
            System.out.printf("%d ", ss.n());
        }
        System.out.println();
    }

}
