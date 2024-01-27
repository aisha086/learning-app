import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:learningapp/controller/questions_controller.dart';

class ViewAnswerChoices extends StatelessWidget {
  ViewAnswerChoices({super.key, required this.type, required this.choices, required this.questionIndex});

  final int questionIndex;
  final String type;
  final List<String> choices;
  bool isCorrect = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (size.width / 2) / (size.height / 9)),
      itemBuilder: (context, index) {
        String decodedChoice = HtmlUnescape().convert(choices[index]);
        return Container(
          margin: const EdgeInsets.only(right: 20, top: 20),
          child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
                  backgroundColor: MaterialStatePropertyAll(setColor(index, context))),
              child: AutoSizeText(
                decodedChoice,
                presetFontSizes: const [18, 15, 12, 10, 8, 6],
                maxLines: 3,
                textAlign: TextAlign.center,
              )),
        );
      },
      itemCount: type == "boolean" ? 2 : 4,
    );
  }
  Color setColor(int index,BuildContext context){
    Color notSelectedColor = Theme.of(context).cardColor;
    Color isCorrectColor = Colors.teal;
    Color isNotCorrectColor = Colors.redAccent;
    if (choices[index] == QuestionsController.correctChoices[questionIndex]) {
      return isCorrectColor;
    } else if (choices[index] == QuestionsController.answerChoices[questionIndex]) {
      return isNotCorrectColor;
    } else {
      return notSelectedColor;
    }
    }

  }

