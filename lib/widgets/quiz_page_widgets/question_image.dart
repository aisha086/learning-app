import 'package:flutter/material.dart';


class QuestionImage extends StatelessWidget {
  const QuestionImage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height / 4,
      width: size.width / 2,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color:Theme.of(context).canvasColor,
          borderRadius: BorderRadius.circular(20)),
      child: Image.asset(
        "assets/images/question_pic.png",
        fit: BoxFit.contain,
      ),
    );
  }
}