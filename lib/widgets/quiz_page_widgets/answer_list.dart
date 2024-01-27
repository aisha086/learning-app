import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:learningapp/controller/questions_controller.dart';
import 'package:provider/provider.dart';

class AnswerChoices extends StatefulWidget {
  AnswerChoices(
      {super.key,
      required this.type,
      required this.choices,
      required this.selectionCount});

  int selectionCount;
  final String type;
  final List<String> choices;

  @override
  State<AnswerChoices> createState() => _AnswerChoicesState();
}

class _AnswerChoicesState extends State<AnswerChoices> {
  @override
  void initState() {
    widget.selectionCount = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color selectedColor = Theme.of(context).primaryColor;
    Color notSelectedColor = Theme.of(context).cardColor;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (size.width / 2) / (size.height / 9)),
      itemBuilder: (context, index) {
        String decodedChoice = HtmlUnescape().convert(widget.choices[index]);
        return Container(
          margin: const EdgeInsets.only(right: 20, top: 20),
          child: ElevatedButton(
              onPressed: () {
                setState(() {
                  Provider.of<QuestionsController>(context, listen: false)
                      .isSelectedList = List.generate(4, (listIndex) => false);
                  Provider.of<QuestionsController>(context, listen: false)
                          .isSelectedList[index] =
                      !Provider.of<QuestionsController>(context, listen: false)
                          .isSelectedList[index];
                  addAnswer(decodedChoice);
                });
              },
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
                  backgroundColor: MaterialStatePropertyAll(
                      Provider.of<QuestionsController>(context, listen: false)
                              .isSelectedList[index]
                          ? selectedColor
                          : notSelectedColor)),
              child: AutoSizeText(
                decodedChoice,
                presetFontSizes: const [18, 15, 12, 10, 8, 6],
                maxLines: 3,
                textAlign: TextAlign.center,
              )),
        );
      },
      itemCount: widget.type == "boolean" ? 2 : 4,
    );
  }

  addAnswer(String choice) {
    if (widget.selectionCount == 0) {
      QuestionsController.answerChoices.add(choice);
      widget.selectionCount++;
    } else {
      QuestionsController.answerChoices.removeLast();
      QuestionsController.answerChoices.add(choice);
    }
    Provider.of<QuestionsController>(context, listen: false).choiceSelected =
        true;
  }
}
