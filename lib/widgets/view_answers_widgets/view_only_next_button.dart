import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/questions_controller.dart';
import '../quiz_page_widgets/score_dialog.dart';

class ViewOnlyNextButton extends StatefulWidget {
  const ViewOnlyNextButton({super.key});

  @override
  State<ViewOnlyNextButton> createState() => _ViewOnlyNextButtonState();
}

class _ViewOnlyNextButtonState extends State<ViewOnlyNextButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ElevatedButton(
      onPressed: () {
          setState(() {
            Provider.of<QuestionsController>(context, listen: false).moveToNextQuestion();
            if(Provider.of<QuestionsController>(context, listen: false).questionIndex==0){
              showDialog(context: context, builder: (context){
                return showScoreDialog(Provider.of<QuestionsController>(context, listen: false).score, context,true);
              });
            }
          });
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
