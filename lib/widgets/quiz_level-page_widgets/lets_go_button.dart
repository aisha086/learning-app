import 'package:flutter/material.dart';
import 'package:learningapp/pages/quiz_page.dart';
import 'package:learningapp/widgets/toast.dart';

class LetsGoButton extends StatelessWidget {
  const LetsGoButton(
      {Key? key, required this.difficulty, required this.categoryId})
      : super(key: key);

  final String difficulty;
  final int categoryId;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: 25),
      child: ElevatedButton(
        onPressed: () {
          if (difficulty == "none") {
            showToast(message: "Select a level first!");
          } else {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => QuizPage(
                          difficulty: difficulty,
                          categoryId: categoryId,
                        )));
          }
        },
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(Size(size.width / 3, 50)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ))),
        child: SizedBox(
          width: size.width / 3,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Let's Go!"),
              Icon(
                Icons.local_fire_department_rounded,
                color: Colors.deepOrange,
              )
            ],
          ),
        ),
      ),
    );
  }
}
