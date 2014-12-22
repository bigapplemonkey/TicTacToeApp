var isP1 = true;  //current player playing
var board = iniBd();   //initial board, a map with cell number for keys
var isC = 0;  //flag for computer turns
var cnt = 0;
var isOv = false;
var won = 0;   // 0 - No win, 1 - Player1 wins, -1 - Player2 wins
var nxMv = "";

//prepare page
$(document).ready(function () {
    $(".cell").prop("disabled", true);
    $("#p2p").addClass("active");
});

//when click on board cell
function mark(cID) {
    if (!isOv) {
        ++cnt;
        var cell = cID.replace("cell", "");    //index in board

        if (board[cell] == 0) {
            if (isP1) {
                board[cell] = 1;
            }  //add value to board
            else {
                board[cell] = -1;
            }

            disImgBd(cID);
            win();

            if (won != 0 || cnt > 8) {
                stpGm();
                return;
            }
            isP1 = !isP1;  //switch players
            gmSt();
        }
    }
}

//display player's image on board
function disImgBd(cID) {
    var i = 0;   //show image for the player in board
    if (!isP1) {
        i = 1;
    }
    var src = "../startbootstrap/img/portfolio/" + plImgs[i] + ".png";
    $("#" + cID).attr("src", src).css("opacity", "1");
}

//communicates with server to check if there is a winner
//also retrieves computer's next move when it's the computer turn
function win() {
    if (cnt > 4 || isC != 0) {
        var url = "../play/game";
        $.ajax({
                   type: "POST",
                   url: url,
                   async: false,
                   cache: false,
                   data: {board: JSON.stringify(board), isComputer: isC, isPlayer1: isP1},
                   success: function (data) {
                       won = data.result;
                       nxMv = data.nextMove;
                   },
                   dataType: "json"
               });
    }
}

//game end and final result gets displayed
function stpGm() {
    isOv = true;
    board = iniBd();
    $("#clock").css("opacity", "0.5");
    var src = null;
    var displayString = disPl();

    switch (won) {
        case 1:    //player1 wins
            src = "../startbootstrap/img/trophy.png";
            $("#pl2Img").fadeOut(100);
            $("#pl1Img").attr("src", src).fadeIn(500);
            $("#curPl").text(displayString + " wins!");
            break;
        case -1:   //player2 wins
            src = "../startbootstrap/img/trophy.png";
            $("#pl1Img").fadeOut(100);
            $("#pl2Img").attr("src", src).fadeIn(500);
            $("#curPl").text(displayString + " wins!");
            break;
        default:    //no one wins
            src = "../startbootstrap/img/even.png";
            $(".player").fadeOut(100).attr("src", src).fadeIn(500);
            $("#curPl").text("It's a tie!");
    }

    $("#refreshButton").hide().removeClass("btn-default").addClass("btn-warning").fadeIn(300);
}

//display current turn, in case of the computer it signals for the next move
function gmSt() {
    var displayText = disPl();

    if (!isP1) {
        $("#pl1Img").fadeOut(50);
        if (isC == -1) {
            setTimeout(function () {
                mark("cell" + nxMv);
            }, 40);
        }
        else {
            $("#pl2Img").fadeIn(100);
            $("#curPl").fadeOut(100).text("Go! " + displayText).fadeIn(300);
        }
    }
    else {
        $("#pl2Img").fadeOut(50);
        if (isC == 1) {
            setTimeout(function () {
                mark("cell" + nxMv);
            }, 40);
        }
        else {
            $("#pl1Img").fadeIn(100);
            $("#curPl").fadeOut(100).text("Go! " + displayText).fadeIn(300);
        }
    }
}

//picks to random image names from a list of names of images available
//returns an array with the names


//initialize the board
//returns a map where the keys are the cell numbers in the board
function iniBd() {
    var returnMap = {};

    returnMap["00"] = 0;
    returnMap["01"] = 0;
    returnMap["02"] = 0;
    returnMap["10"] = 0;
    returnMap["11"] = 0;
    returnMap["12"] = 0;
    returnMap["20"] = 0;
    returnMap["21"] = 0;
    returnMap["22"] = 0;
    return returnMap;
}

function pkGm(id) {
    switch (id) {
        case "p2p":
            $("#c2p").removeClass("btn-warning active").addClass("btn-default");
            $("#p2c").removeClass("btn-warning active").addClass("btn-default");
            $("#p2p").removeClass("btn-default active").addClass("btn-warning");
            src = "../startbootstrap/img/player.png";
            $("#pl1Img").fadeOut(0).attr("src", src).fadeIn(300);
            src = "../startbootstrap/img/player.png";
            $("#pl2Img").fadeOut(0).attr("src", src).fadeIn(300);
            isC = 0;
            break;
        case "c2p":
            $("#p2p").removeClass("btn-warning active").addClass("btn-default");
            $("#p2c").removeClass("btn-warning active").addClass("btn-default");
            $("#c2p").removeClass("btn-default active").addClass("btn-warning");
            src = "../startbootstrap/img/computer.png";
            $("#pl1Img").fadeOut(0).attr("src", src).fadeIn(300);
            src = "../startbootstrap/img/player.png";
            $("#pl2Img").fadeOut(0).attr("src", src).fadeIn(300);
            isC = 1;
            break;
        default:
            $("#p2p").removeClass("btn-warning active").addClass("btn-default");
            $("#c2p").removeClass("btn-warning active").addClass("btn-default");
            $("#p2c").removeClass("btn-default active").addClass("btn-warning");
            src = "../startbootstrap/img/computer.png";
            $("#pl2Img").fadeOut(0).attr("src", src).fadeIn(300);
            src = "../startbootstrap/img/player.png";
            $("#pl1Img").fadeOut(0).attr("src", src).fadeIn(300);
            isC = -1;
    }

}

function strGm() {
    $(".cell").css("opacity", "0.6").click(function () {
        mark(this.id);
    });
    $(".pkGm").prop('disabled', true);

    if (isC == 1) {
        $("#pl2Img").fadeOut(150);
        $("#curPl").text("Go Computer!");
        setTimeout(function () {
            mark(rdmCor());
        }, 40);
    }
    else {
        $("#pl2Img").fadeOut(150);
        $("#curPl").text("Go! Player 1");
    }
}

function disPl() {
    var displayString = "Computer";
    if (isC == 0) {
        if (isP1) {
            displayString = "Player 1";
        }
        else {
            displayString = "Player 2";
        }
    }
    else {
        if (!isP1 && isC == 1) {
            displayString = "Player 2";
        }
        if (isP1 && isC == -1) {
            displayString = "Player 1";
        }
    }
    return displayString;
}

function rdmCor() {
    var images = [ "cell00", "cell20", "cell02", "cell22" ];
    var index = Math.floor(Math.random() * 4);
    return images[index];
}
