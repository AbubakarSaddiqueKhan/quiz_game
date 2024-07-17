import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constatnts.dart';
import 'package:quiz_app/controllers/quiz_checking_controller.dart';
import 'package:quiz_app/models/quiz_questions.dart';
import 'package:websafe_svg/websafe_svg.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuizCheckingController quizCheckingController =
        Get.put(QuizCheckingController());
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: WebsafeSvg.asset("assets/icons/bg.svg", fit: BoxFit.cover),
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Spacer(
                  flex: 3,
                ),
                Text(
                  "Score",
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(color: kSecondaryColor),
                ),
                const Spacer(),
                Text(
                  "${quizCheckingController.correctAns * 10}/${questions.length * 10}",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: kSecondaryColor),
                ),
                const Spacer(
                  flex: 3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
