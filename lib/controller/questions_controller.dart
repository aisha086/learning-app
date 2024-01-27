import 'package:flutter/material.dart';
import 'package:learningapp/models/question.dart';

import '../services/api_services/trivia_questions.dart';

class QuestionsController extends ChangeNotifier {
  List<Question> _questionList = [];
  QuestionsApi questionApiService = QuestionsApi();

  int _questionIndex = 0;
  int get questionIndex => _questionIndex;

  bool choiceSelected = false;
  List<bool> isSelectedList = List.generate(4, (listIndex) => false);

  int score = 0;
  // late Timer _timer;
  // int _remainingTime = 10;
  // int get remainingTime => _remainingTime;
  static List<String> answerChoices = [];
  static List<String> correctChoices = [];

  List<Question> get questionList => _questionList;

  getQuestionsList(
      {required int categoryId, required String difficulty}) async {
    _questionList = await questionApiService.getQuestions(
        category: categoryId, difficulty: difficulty);
    notifyListeners();
  }

  void toggleSelection(){
    choiceSelected = !choiceSelected;
    notifyListeners();
  }

  void moveToNextQuestion() {
    if (_questionIndex < _questionList.length - 1) {
      _questionIndex++;
      // _remainingTime = 10;
      // startTimer();
      notifyListeners();
    }
    else{
      _questionIndex = 0;
    }
  }

  makeSelectedListFalse(){
    isSelectedList = List.generate(4, (listIndex) => false);
  }

  // void startTimer(){
  //   _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
  //     if (_remainingTime > 0) {
  //         _remainingTime--;
  //         print(_remainingTime);
  //     } else {
  //       _timer.cancel();
  //       moveToNextQuestion();
  //     }
  //   });
  //   notifyListeners();
  // }

}
