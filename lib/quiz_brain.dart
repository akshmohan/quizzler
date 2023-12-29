import 'package:quizzler_mine/questions.dart';

class QuizzBrain {
  int _questionNumber = 0; //MADE THE VARIABLE PRIVATE(ENCAPSULATION)

  List<Questions> _questionBank = [
    //LIST THAT CONTAINS ALL QUESTIONS AND ANSWERS
    Questions('You can lead a cow down stairs but not up stairs.', false),
    Questions(
        'Approximately one quarter of human bones are in the feet.', true),
    Questions('A slug\'s blood is green.', true),
    Questions('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Questions('It is illegal to pee in the Ocean in Portugal.', true),
    Questions(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Questions(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Questions(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Questions(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Questions('Google was originally called \"Backrub\".', true),
    Questions(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Questions(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true)
  ]; //END OF LIST

  //BUNCH O' FUNCTIONS DOWN UNDER!!

  void nextQuestion() {
    //FUNCTION TO MOVE TO THE NEXT QUESTION IN THE LIST
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
    print(_questionNumber);
    print(_questionBank.length);
  }

  String? getQuestionText() {
    //FUNCTION TO ACTUALLY GET THE QUESTION FROM THE LIST
    return _questionBank[_questionNumber].questionText;
  }

  bool? getCorrectAnswer() {
    //FUNCTION TO GET THE TRUE/FALSE ANSWER IN THE LIST
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    //FUNCTION TO CHECK WHETHER THE END OF THE LIST HAS BEEN REACHED
    if (_questionNumber >= _questionBank.length - 1) {
      print("End reached");
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    //FUNCTION TO RESET THE LIST
    _questionNumber = 0;
  }
}
