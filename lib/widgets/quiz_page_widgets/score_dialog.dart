import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learningapp/controller/questions_controller.dart';
import 'package:learningapp/pages/view_answers_page.dart';
import 'package:provider/provider.dart';
import '../../pages/home_page.dart';

showScoreDialog(int score, BuildContext context, bool isViewOnly) {
  bool isPassed = false;
  Size size = MediaQuery.of(context).size;
  if (score >= 10 * 0.6) {
    // pass if 60 %
    isPassed = true;
  }
  String title = isPassed ? "Congratulations!\nPassed " : "OOPS!\nFailed";
  IconData iconAsset =
      isPassed ? CupertinoIcons.star_slash_fill : Icons.heart_broken_rounded;
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    elevation: 0, // Remove shadow
    backgroundColor: Colors.transparent, // Make background transparent
    child: Container(
      padding: const EdgeInsets.all(20),
      height: size.height / 2,
      width: size.width - 40,
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconAsset,
            size: size.height / 5.5, // Adjust the height of the icon
            color: isPassed ? Colors.amber : Colors.red[900]!,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "$title\nScore:$score",
              style: const TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const GoToHomeButton(),
          const SizedBox(height: 20),
          isViewOnly?const SizedBox():const ViewAnswersButton()
        ],
      ),
    ),
  );
}


class ViewAnswersButton extends StatelessWidget {
  const ViewAnswersButton({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ElevatedButton(
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size(size.width / 3, 35)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ))),
      child: const Text("View Answers"),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>  const ViewAnswersPage()),
        );
      },
    );
  }
}

class GoToHomeButton extends StatelessWidget {
  const GoToHomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ElevatedButton(
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size(size.width / 3, 35)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ))),
      child: const Text("Homepage"),
      onPressed: () {
        Provider.of<QuestionsController>(context,listen: false).score = 0;
        Provider.of<QuestionsController>(context,listen: false).questionList.clear();
        QuestionsController.correctChoices.clear();
        QuestionsController.answerChoices.clear();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>  const HomePage()),
        );
      },
    );
  }
}
