// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants/colors.dart';

import 'package:tic_tac_toe/constants/fonts.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  // First Player
  bool oTurn = true;
  var result = '';
  List<String> displayX0 = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  int filledBoxes = 0;
  bool winnerFound = false;
  bool showReset = false;
  void _boxTapped(int index) {
    setState(() {
      if (oTurn && displayX0[index] == '') {
        displayX0[index] = 'O';
        filledBoxes++;
      } else if (!oTurn && displayX0[index] == '') {
        displayX0[index] = 'X';
        filledBoxes++;
      }
      oTurn = !oTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    //Check 1st Row

    if (displayX0[0] == displayX0[1] &&
        displayX0[0] == displayX0[2] &&
        displayX0[0] != '') {
      setState(() {
        result = 'Player ${displayX0[0]} Wins!';
        winnerFound = true;
      });
    }

    //Check 2nd Row

    if (displayX0[3] == displayX0[4] &&
        displayX0[3] == displayX0[5] &&
        displayX0[3] != '') {
      setState(() {
        result = 'Player ${displayX0[3]} Wins!';
        winnerFound = true;
      });
    }

    //Check 3rd Row

    if (displayX0[6] == displayX0[7] &&
        displayX0[6] == displayX0[8] &&
        displayX0[6] != '') {
      setState(() {
        result = 'Player ${displayX0[6]} Wins!';
        winnerFound = true;
      });
    }

//Check 1st Column

    if (displayX0[0] == displayX0[3] &&
        displayX0[0] == displayX0[6] &&
        displayX0[0] != '') {
      setState(() {
        result = 'Player ${displayX0[0]} Wins!';
        winnerFound = true;
      });
    }

    //Check 2nd Column

    if (displayX0[1] == displayX0[4] &&
        displayX0[1] == displayX0[7] &&
        displayX0[1] != '') {
      setState(() {
        result = 'Player ${displayX0[1]} Wins!';
        winnerFound = true;
      });
    }

    //Check 3rd Column

    if (displayX0[2] == displayX0[5] &&
        displayX0[2] == displayX0[8] &&
        displayX0[2] != '') {
      setState(() {
        result = 'Player ${displayX0[2]} Wins!';
        winnerFound = true;
      });
    }

    //Check Diagonal 1 Lt_Top - Rt_Bottom

    if (displayX0[0] == displayX0[4] &&
        displayX0[0] == displayX0[8] &&
        displayX0[0] != '') {
      setState(() {
        result = 'Player ${displayX0[0]} Wins!';
        winnerFound = true;
      });
    }

    //Check Diagonal 2nd Rt_Top - Lt_Bottom

    if (displayX0[6] == displayX0[4] &&
        displayX0[6] == displayX0[2] &&
        displayX0[6] != '') {
      setState(() {
        result = 'Player ${displayX0[6]} Wins!';
        winnerFound = true;
      });
    }

    // Check For Draw

    if (winnerFound != true && filledBoxes == 9) {
      result = 'Noboby Wins\nIt\'s a draw !';
      showReset = true;
    }
    if (winnerFound == true) showReset = true;
  }

  @override
  Widget build(BuildContext context) {
    void clearBoard() {
      setState(() {
        for (int i = 0; i < 9; i++) displayX0[i] = '';
      });
      result = '';
      showReset = false;
    }

    return Scaffold(
        backgroundColor: boardBGColor,
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              SizedBox(
                height: 90,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Text('Tic - Tac - Toe', style: kHeadingStyle),
                ),
              ),
              SizedBox(height: 25),
              Expanded(
                flex: 5,
                child: GridView.builder(
                    itemCount: 9,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          _boxTapped(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: boardBoxColor,
                              borderRadius: BorderRadius.circular(15),
                              border:
                                  Border.all(width: 5, color: boardBGColor)),
                          child: Center(
                            child: Text(
                              displayX0[index],
                              style: kBoardStyle,
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(height: 30),
              Expanded(
                child: Text(
                  result,
                  style: kResultStyle,
                  textAlign: TextAlign.center,
                ),
                flex: 2,
              ),
              showReset
                  ? SizedBox(
                      height: 50,
                      width: 200,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: pColor, shape: StadiumBorder()),
                        onPressed: () {
                          // Clear Board
                          clearBoard();
                        },
                        child: Text('Play Again !'),
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ));
  }
}
