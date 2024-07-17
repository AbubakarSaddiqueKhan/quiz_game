import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constatnts.dart';
import 'package:quiz_app/controllers/quiz_checking_controller.dart';
import 'package:quiz_app/models/quiz_questions.dart';

class AnswerOptionWidget extends StatelessWidget {
  const AnswerOptionWidget(
      {super.key,
      required this.currentQuizAnswerIndex,
      required this.currentQuizAnswer,
      required this.onTap});
  final int currentQuizAnswerIndex;
  final String currentQuizAnswer;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizCheckingController>(
        init: QuizCheckingController(),
        builder: (quizCheckingController) {
          Color getTheRightColor() {
            if (quizCheckingController.isAnswered) {
              if (currentQuizAnswerIndex == quizCheckingController.correctAns) {
                return kGreenColor;
              } else if (currentQuizAnswerIndex ==
                      quizCheckingController.selectedAns &&
                  quizCheckingController.selectedAns !=
                      quizCheckingController.correctAns) {
                return kRedColor;
              }
            }
            return kGrayColor;
          }

          IconData getTheRightIcon() {
            return getTheRightColor() == kRedColor ? Icons.close : Icons.done;
          }

          return InkWell(
            onTap: onTap,
            child: Container(
              margin: const EdgeInsets.only(top: kDefaultPadding),
              padding: const EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                  border: Border.all(color: getTheRightColor()),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${currentQuizAnswerIndex + 1}. ${currentQuizAnswer.toString()}",
                    style: TextStyle(color: getTheRightColor(), fontSize: 16),
                  ),
                  Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                        color: getTheRightColor() == kGrayColor
                            ? Colors.transparent
                            : getTheRightColor(),
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: getTheRightColor())),
                    child: getTheRightColor() == kGrayColor
                        ? null
                        : Icon(
                            getTheRightIcon(),
                            size: 16,
                          ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
