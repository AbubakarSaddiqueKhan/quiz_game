import 'package:flutter/material.dart';
import 'package:quiz_app/constatnts.dart';
import 'package:quiz_app/models/quiz_questions.dart';

class QuizQuestionTextWidget extends StatelessWidget {
  const QuizQuestionTextWidget({super.key, required this.currentQuizQuestion});
  final String currentQuizQuestion;

  @override
  Widget build(BuildContext context) {
    return Text(
      currentQuizQuestion,
      style:
          Theme.of(context).textTheme.bodyLarge?.copyWith(color: kBlackColor),
    );
  }
}
