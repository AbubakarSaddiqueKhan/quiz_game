import 'package:flutter/material.dart';
import 'package:quiz_app/constatnts.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'dart:developer' as developer;

class ProgressBar extends StatefulWidget {
  const ProgressBar({super.key, required this.progressBarCompletedPercentage});
  final double progressBarCompletedPercentage;

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
          border: Border.all(width: 3, color: const Color(0xFF3F4768)),
          borderRadius: BorderRadius.circular(50)),
      child: Stack(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              developer.log(
                  "Progress value  : ${widget.progressBarCompletedPercentage.toString()}");
              return Container(
                width: constraints.maxWidth *
                    widget.progressBarCompletedPercentage,
                decoration: BoxDecoration(
                    gradient: kPrimaryGradient,
                    borderRadius: BorderRadius.circular(50)),
              );
            },
          ),
          Positioned.fill(
              child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    "${(widget.progressBarCompletedPercentage * 60).round()} sec"),
                WebsafeSvg.asset("assets/icons/clock.svg"),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
