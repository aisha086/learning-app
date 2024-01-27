
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';

class QuizQuestion extends StatelessWidget {
  const QuizQuestion({super.key,required this.question});
  final String question;

  @override
  Widget build(BuildContext context) {

    String decodedText = HtmlUnescape().convert(question);

    return Container(
      margin: const EdgeInsets.all(30),
      child: AutoSizeText(decodedText,
        presetFontSizes: const [
          18,
          15,
          12,
          10
        ],
        maxLines: 4,
        textAlign: TextAlign.center,
      ),
    );
  }
}
