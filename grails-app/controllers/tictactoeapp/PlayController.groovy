package tictactoeapp

import grails.converters.JSON

class PlayController {

    def ticTacToeService

    def index() {
        Map model = [disImgs: ticTacToeService.disImgs()]
        render(view:"index",model:model)

    }

    def game() {
        //parameters from client
        def jsonMatrix = JSON.parse(params.board)
        def isComputer = params.isComputer
        def isPlayer1 = params.isPlayer1

        //converting parameters
        isPlayer1 = isPlayer1.equals("true")
        isComputer = isComputer.toInteger()
        Map<String, Integer> test = jsonMatrix

        //model to client
        Map model = [:]
        int result = ticTacToeService.isWin(jsonMatrix)

        model["result"] = result

        //only retrieves next move when it's computer's turn
        if (result == 0 && isComputer != 0) {
            if ((isPlayer1 && isComputer == -1) || (!isPlayer1 && isComputer == 1)) {
                model["nextMove"] = ticTacToeService.jorgeMove(test, isComputer, isComputer)
            }
        }
        render(model as JSON)
    }

}
