import 'package:ar_fruits_app/Game/Game_Controller.dart';
import 'package:flutter/material.dart';

class GameGUI extends StatefulWidget {
  @override
  _GameGUIState createState() => _GameGUIState();
}

class _GameGUIState extends State<GameGUI> {
  final TextEditingController _minNumberController = TextEditingController();
  final TextEditingController _maxNumberController = TextEditingController();
  final TextEditingController _guessedNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[50],
      appBar: AppBar(
        title: Text(
          'Number Guessing Game',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
        backgroundColor: Colors.cyan[700],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (!GameController.gameStarted)
              Column(
                children: <Widget>[
                  TextField(
                    controller: _minNumberController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter minimum number',
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.minimize),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _maxNumberController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter maximum number',
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.add),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                       int min = int.parse(_minNumberController.text.toString());
                       int max = int.parse(_maxNumberController.text.toString());
                       GameController.startGame(min, max);
                      });
                    },
                    child: Text('Start Game'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      textStyle: TextStyle(fontSize: 18),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                    ),
                  ),
                ],
              ),
            if (GameController.gameStarted)
              Column(
                children: <Widget>[
                  Text(
                    'Guess the number!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.cyan[900]),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _guessedNumberController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your guess',
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.question_mark),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        int guessedNumber = int.parse(_guessedNumberController.text.toString());

                        GameController.checkGuess(context, guessedNumber);

                      });
                      // This is where you would call your checkGuess function
                    },
                    child: Text('Guess'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      textStyle: TextStyle(fontSize: 18),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
