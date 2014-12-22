package tictactoeapp

class TicTacToeService {

    //receives a matrix of 1,-1, 0 in a Map
    // 1=First Player; 1=Second Player; 0=Free Cell
    // returns 1, -1 for winner or 0 is there is no win
    public int isWin(matrix) {
        int returnValue = 0
        int lineSum = 0

        // Check rows
        for (int row = 0; row <= 2; ++row) {
            lineSum = matrix["${row}0"] + matrix["${row}1"] + matrix["${row}2"]
            returnValue = compare(lineSum)
            if (!returnValue.equals(0)) {
                return returnValue
            }
        }

        // Check columns
        for (int col = 0; col <= 2; ++col) {
            lineSum = matrix["0${col}"] + matrix["1${col}"] + matrix["2${col}"]
            returnValue = compare(lineSum)
            if (!returnValue.equals(0)) {
                return returnValue
            }
        }

        // Check diagonals
        lineSum = matrix["00"] + matrix["11"] + matrix["22"]
        returnValue = compare(lineSum)
        if (!returnValue.equals(0)) {
            return returnValue
        }
        lineSum = matrix["20"] + matrix["11"] + matrix["02"]
        returnValue = compare(lineSum)
        if (!returnValue.equals(0)) {
            return returnValue
        }
        return returnValue
    }

    public int compare(int lineSum) {
        if (lineSum % 3 == 0) {
            return lineSum / 3
        }
        return 0
    }

    //this methods triggers calculations for the Minimax algorithm
    //this is the root for the first tree
    // it returns a string representing the cell that should be picked
    public String jorgeMove(Map<String, Integer> board, int currentPlayer, int initialPlayer) {

        String nextMove = ""
        List<String> freeCells = freeCells(board)
        List<String> currentFreeCells = []
        int currentScore
        int bestScore = -1
        Integer depth = null

        if (freeCells.size() == 8) {
            return cornerOrCenter(freeCells)
        }

        freeCells.each {
            Map<String, Integer> boardClon = [:]
            boardClon.putAll(board)
            boardClon.put(it, currentPlayer)
            currentFreeCells = freeCells.minus(it)

            currentScore = jorgeMiniMax(boardClon, currentPlayer * -1, initialPlayer, 1, depth, currentFreeCells)

            if (currentScore >= bestScore) {
                bestScore = currentScore
                nextMove = it
            }
        }
        return nextMove
    }

    public int jorgeMiniMax(Map<String, Integer> board, int currentPlayer, int initialPlayer, int level, Integer depth = null, List<String> freeCells) {
        List<String> currentFreeCells = []
        int result = isWin(board)

        if (result == 0) {
            if (freeCells.isEmpty()) {
                return 0
            }

        }
        else {
            if (result == initialPlayer) {
                return 1
            }
            else {
                return -1
            }
        }

        if (!depth.equals(null)) {
            if (depth == 0) {
                return 0
            }
            depth -= 1
        }

        int counter = 0
        int maxScore = -1;
        int thisScore;

        freeCells.each {
            ++counter
            Map<String, Integer> currentBoard = [:]
            currentBoard.putAll(board)
            currentBoard.put(it, currentPlayer);
            currentFreeCells = freeCells.minus(it)
            thisScore = jorgeMiniMax(currentBoard, currentPlayer * -1, initialPlayer, ++level, depth, currentFreeCells);
            if (currentPlayer != initialPlayer) {
                thisScore = thisScore * -1
            }


            if (thisScore >= maxScore) {
                maxScore = thisScore;
            }
        }

        if (currentPlayer != initialPlayer) {
            maxScore = maxScore * -1
        }

        return maxScore;
    }

    // returns a list of strings representing the available cells
    public List<String> freeCells(Map<String, Integer> matrix) {
        List<String> returnList = []
        matrix.each {
            if (it.value == 0) {
                returnList.add(it.key)
            }
        }
        return returnList
    }

    public List<String> disImgs() {
        List<String> images = ["cabin", "cake", "circus", "submarine"];
        int index1 = Math.abs(new Random().nextInt() % 4)
        int index2 = Math.abs(new Random().nextInt() % 4)
        while (index2 == index1) {
            index2 = Math.abs(new Random().nextInt() % 4);
        }
        return [images[index1], images[index2]];
    }

    public String cornerOrCenter(List<String> freeCells) {
        if (freeCells.contains("11")) {
            return "11"
        }
        else {
            List<String> corners = ["00", "02", "20", "22"];
            int index = Math.abs(new Random().nextInt() % 4)
            return corners[index]

        }
    }

    //only for debugging of Minimax algorithm
    public void printBoard(Map<String, Integer> board1) {

        Map<String, String> board = [:]
        board1.each {
            if (it.value == -1) {
                board.put(it.key, "O")
            }
            else if (it.value == 1) {
                board.put(it.key, "X")
            }
            else {
                board.put(it.key, " ")
            }
        }

        log.debug("---------------------------------------------------------")
        log.debug("--> ${board["00"]} |  ${board["01"]} | ${board["02"]}")
        log.debug("--> ${board["10"]} |  ${board["11"]} | ${board["12"]}")
        log.debug("--> ${board["20"]} |  ${board["21"]} | ${board["22"]}")
        log.debug("---------------------------------------------------------")
    }


}
