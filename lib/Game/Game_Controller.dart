
import 'dart:math';

import 'package:alert_dialog/alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameController{

  static int? targetNumber;

  static bool gameStarted = false;

  static  _getRandomNumber(int min, int max) {
    // Ensure that the min is less than or equal to max
    if (min > max) {
      int temp = min;
      min = max;
      max = temp;
    }
    // Create a random number generator
    Random random = Random();
    // Generate a random number between min and max (inclusive)
    // return min + random.nextInt((max - min) + 1);

    targetNumber = min + random.nextInt((max - min) + 1);

  }

  static void checkGuess(BuildContext context,  int guessedNumber) async{
    if (guessedNumber == targetNumber) {
      resetGame();
      _showDialog(context);
    } else {
      String message = guessedNumber < targetNumber!
          ? 'My number is greater than your guessed number.'
          : 'My number is less than your guessed number.';
      _showSnackbar(context, message);
    }
  }

  static void _showDialog(BuildContext context) {
    alert(context,
        title: Text(
          "Game Finished",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Text('Congratulations You guessed the number!'));
  }

  static void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 1),
      ),
    );
  }

  static resetGame(){
    gameStarted = false;
  }

  static startGame(int min, int max){
    gameStarted = true;
    _getRandomNumber(min, max);
  }

}