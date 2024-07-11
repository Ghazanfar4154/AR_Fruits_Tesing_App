import 'package:ar_fruits_app/ArView.dart';
import 'package:ar_fruits_app/Game/Game_GUI.dart';
import 'package:ar_fruits_app/QR_Code_Scanner.dart';
import 'package:ar_fruits_app/Quiz/Quiz_GUI.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black,
              Colors.blue.shade900],
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to QR scan screen
                Navigator.push(context, MaterialPageRoute(
                    builder: (_){
                      return QrCodeScanner();
                    }));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: Text(
                'Scan QR Code for AR',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (_){
                      return GameGUI();
                    }));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: Text(
                'Start Game',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to quiz selection screen
                Navigator.push(context, MaterialPageRoute(
                    builder: (_){
                      return QuizApp();
                    }));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: Text(
                'Start Quiz',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
