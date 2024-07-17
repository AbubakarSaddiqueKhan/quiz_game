import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quiz_app/models/quiz_questions.dart';
import 'package:quiz_app/screens/score_screen.dart';

class QuizCheckingController extends GetxController {
  bool _isAnswered = false;
  bool get isAnswered => _isAnswered;

  final PageController _pageController = PageController();
  PageController get pageController => _pageController;

  int _correctAns = 0;
  int get correctAns => _correctAns;

  int _selectedAns = 0;
  int get selectedAns => _selectedAns;

  final RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => _questionNumber;

  int _numberOfCorrectAns = 0;
  int get numberOfCorrectAns => _numberOfCorrectAns;

  void checkAns(
      {required Question question,
      required int selectedOptionIndex,
      required BuildContext context}) {
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedOptionIndex;
    if (_correctAns == _selectedAns) {
      _numberOfCorrectAns++;
      update();

      Future.delayed(
        const Duration(
          seconds: 1,
        ),
        () {
          _isAnswered = false;
          _pageController.nextPage(
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
        },
      );
    } else {
      if (questionNumber.value == 4) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ScoreScreen(),
        ));
      } else {
        Future.delayed(
          const Duration(
            seconds: 1,
          ),
          () {
            _isAnswered = false;
            _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease);
          },
        );
      }
    }
  }

  void nextQuestion() {
    if (_questionNumber.value != questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  void updateTheQuestionNumber(int index) {
    _questionNumber.value = index + 1;
  }
}
