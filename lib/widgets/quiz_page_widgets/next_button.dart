import 'package:flutter/material.dart';
import 'package:learningapp/controller/questions_controller.dart';
import 'package:learningapp/widgets/quiz_page_widgets/score_dialog.dart';
import 'package:learningapp/widgets/toast.dart';
import 'package:provider/provider.dart';

class NextQuestionButton extends StatefulWidget {
  const NextQuestionButton({super.key});

  @override
  State<NextQuestionButton> createState() => _NextQuestionButtonState();
}

class _NextQuestionButtonState extends State<NextQuestionButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ElevatedButton(
      onPressed: () {
        if(Provider.of<QuestionsController>(context, listen: false).choiceSelected){
          setState(() {
            if(QuestionsController.answerChoices.last == QuestionsController.correctChoices.last){
              Provider.of<QuestionsController>(context, listen: false).score++;
            }
            Provider.of<QuestionsController>(context, listen: false).toggleSelection();
            Provider.of<QuestionsController>(context, listen: false).moveToNextQuestion();
            Provider.of<QuestionsController>(context, listen: false).makeSelectedListFalse();
            if(Provider.of<QuestionsController>(context, listen: false).questionIndex==0){
              showDialog(context: context, builder: (context){
                return showScoreDialog(Provider.of<QuestionsController>(context, listen: false).score, context,false);
              });
            }
          });
        }
        else{
          showToast(message: "Choose an option");
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Theme.of(context).cardColor),
          minimumSize: MaterialStateProperty.all(Size(size.width / 3, 60)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ))),
      child: const Text("Next",
        style: TextStyle(
          fontSize: 18
        ),
      ),
    );
  }
}
