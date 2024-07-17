import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/componenets/anser_option_widget.dart';
import 'package:quiz_app/componenets/progress_bar.dart';
import 'package:quiz_app/componenets/quiz_question_custom_widget.dart';
import 'package:quiz_app/componenets/quiz_question_text_widget.dart';
import 'package:quiz_app/constatnts.dart';
import 'package:quiz_app/controllers/quiz_checking_controller.dart';
import 'package:quiz_app/models/quiz_questions.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'dart:developer' as developer;

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen>
    with SingleTickerProviderStateMixin {
  final QuizCheckingController quizCheckingController =
      Get.put(QuizCheckingController());
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 60));

    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(
        () {
          setState(() {});
        },
      );
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    startAnimation();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  void startAnimation() {
    developer.log("Animation is started ...");
    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        _animationController.forward();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () {
                quizCheckingController.nextQuestion();
              },
              child: const Text("Skip"),
            ),
          )
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          WebsafeSvg.asset("assets/icons/bg.svg", fit: BoxFit.cover),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              children: [
                ProgressBar(
                  progressBarCompletedPercentage: _animation.value,
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                Obx(
                  () => Text.rich(TextSpan(
                      text: "Question ${quizCheckingController.questionNumber}",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(color: kSecondaryColor),
                      children: [
                        TextSpan(
                            text: "/${questions.length}",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(color: kSecondaryColor))
                      ])),
                ),
                const Divider(
                  thickness: 1.5,
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                Expanded(
                    child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: quizCheckingController.pageController,
                  onPageChanged: quizCheckingController.updateTheQuestionNumber,
                  itemCount: sample_data.length,
                  itemBuilder: (context, index) => Padding(
                    padding:
                        const EdgeInsets.only(bottom: 50, left: 10, right: 10),
                    child: QuizQuestionCustomWidget(
                      currentQuizQuestion: questions[index],
                    ),
                  ),
                ))
              ],
            ),
          ))
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     startAnimation();
      //   },
      // ),
    );
  }
}
