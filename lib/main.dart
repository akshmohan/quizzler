import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizzBrain quizzBrain =
    QuizzBrain(); //CREATING AN OBJECT FOR THE 'QuizzBrain' CLASS IN 'quiz_brain.dart' FILE

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Icon> scoreKeeper = []; //CREATING AN INITIAL EMPTY LIST FOR THE ICONS TO BE ADDED IN THE ROW AT THE BOTTOM

  int correctAnswerCount = 0;

  void checkAnswer(bool userPickedAnswer) {
    //CREATING A FUNCTION TO CHECK THE USERS OPTION AGAINST THE ACTUAL ANSWER IN THE LIST
    bool? correctAnswer = quizzBrain.getCorrectAnswer();

    setState(() {
      if (quizzBrain.isFinished() == true) {
        if(userPickedAnswer == correctAnswer) {
          correctAnswerCount++;
        }
        Alert(
          //IMPLEMENTING THE 'rflutter_alert' PACKAGE FOR ALERT MESSAGE
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.\nYour score is $correctAnswerCount/12',
        ).show();

        quizzBrain
            .reset(); //CALLING THE 'reset()' FUNCTION FROM 'quiz_brain.dart' FILE

        scoreKeeper = [];//WE RESET THE LIST
        correctAnswerCount = 0;

      } else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          )); //ADDING THE CHECK AND CLOSE ICONS IN THE ROW ACCORDINGLY
          correctAnswerCount++;
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizzBrain
            .nextQuestion(); //CALLING THE 'nextQuestion()' FUNCTION TO MOVE TO THE NEXT QUESTION ONCE AN ICON IS ADDED IN THE ROW
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizzBrain.getQuestionText().toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(
                    true); //CALLING THE 'checkAnswer' FUNCTION WHEN THE USER PRESSES ONE OF THE OPTIONS
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(
                    false); //CALLING THE 'checkAnswer' FUNCTION WHEN THE USER PRESSES ONE OF THE OPTIONS
              },
            ),
          ),
        ),
        Row(
          //THE CHECK AND CLOSE ICONS ARE ADDED TO THIS ROW(WHICH IS OBVIOUSLY AT THE BOTTOM OF THE SCREEN)
          children: List<Widget>.generate(
            scoreKeeper.length,
            (index) => scoreKeeper[index],
          ),
        ),
      ],
    );
  }
}
