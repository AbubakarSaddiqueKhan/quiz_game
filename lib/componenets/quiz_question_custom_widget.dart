import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/componenets/anser_option_widget.dart';
import 'package:quiz_app/componenets/quiz_question_text_widget.dart';
import 'package:quiz_app/constatnts.dart';
import 'package:quiz_app/controllers/quiz_checking_controller.dart';
import 'package:quiz_app/models/quiz_questions.dart';

class QuizQuestionCustomWidget extends StatefulWidget {
  const QuizQuestionCustomWidget(
      {super.key, required this.currentQuizQuestion});
  final Question currentQuizQuestion;

  @override
  State<QuizQuestionCustomWidget> createState() =>
      _QuizQuestionCustomWidgetState();
}

class _QuizQuestionCustomWidgetState extends State<QuizQuestionCustomWidget> {
  final QuizCheckingController _quizCheckingController =
      Get.put(QuizCheckingController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: Column(
        children: [
          QuizQuestionTextWidget(
            currentQuizQuestion: widget.currentQuizQuestion.question,
          ),
          const SizedBox(
            height: kDefaultPadding / 2,
          ),
          ...List.generate(
            sample_data.length,
            (index) {
              return AnswerOptionWidget(
                currentQuizAnswer: widget.currentQuizQuestion.options[index],
                currentQuizAnswerIndex: index,
                onTap: () {
                  return _quizCheckingController.checkAns(
                      question: widget.currentQuizQuestion,
                      context: context,
                      selectedOptionIndex: index);
                },
              );
            },
          )
        ],
      ),
    );
  }
}
