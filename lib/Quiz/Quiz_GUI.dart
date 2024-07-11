import 'package:flutter/material.dart';
import 'package:alert_dialog/alert_dialog.dart';

import 'Question_Brain.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  QuestionBrain qb = QuestionBrain();
  List<Icon> result = [];
  int score = 0;
  bool _showQuizSelectionDialog = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiz APP',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: _showQuizSelectionDialog
          ? _buildQuizSelectionScreen()
          : _buildQuizScreen(),
    );
  }

  Widget _buildQuizSelectionScreen() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/quiz.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      padding: const EdgeInsets.fromLTRB(23, 23, 23, 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                QuestionBrain.questionbrain = QuestionBrain.questionMath;
                _showQuizSelectionDialog = false;
              });
            },
            icon: Icon(Icons.calculate_rounded),
            label: Text(
              'Math Quiz',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              padding: EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                QuestionBrain.questionbrain = QuestionBrain.questionCountriesCapital;
                _showQuizSelectionDialog = false;
              });
            },
            icon: Icon(Icons.location_city_rounded),
            label: Text(
              'Countries Capital Quiz',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              padding: EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuizScreen() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/quiz.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      padding: const EdgeInsets.all(23.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            margin: EdgeInsets.only(top: 40.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 10.0,
            color: Colors.amber.withOpacity(0.8),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                qb.getData().question,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Center(),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                ),
                onPressed: () {
                  checkAnswer(true);
                },
                child: Text(
                  'True',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                ),
                onPressed: () {
                  checkAnswer(false);
                },
                child: Text(
                  'False',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
          Row(
            children: result,
          ),
        ],
      ),
    );
  }

  void checkAnswer(bool ans) {
    setState(() {
      if (qb.isFinshed() == true) {
        alert(
          context,
          title: Text(
            "Quiz Finished",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text('You got $score points'),
        );
        qb.rest();
        result = [];
        score = 0;
      } else {
        if (ans == qb.getData().answer) {
          result.add(Icon(Icons.check, color: Colors.green, size: 30.0));
          score++;
        } else {
          result.add(Icon(Icons.close, color: Colors.red, size: 30.0));
        }
        qb.nextQuestion();
      }
    });
  }
}
