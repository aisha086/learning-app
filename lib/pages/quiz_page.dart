
import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:learningapp/controller/questions_controller.dart';
import 'package:learningapp/widgets/quiz_page_widgets/answer_list.dart';
import 'package:learningapp/widgets/quiz_page_widgets/next_button.dart';
import 'package:learningapp/widgets/quiz_page_widgets/quiz_question.dart';
import 'package:provider/provider.dart';

import '../widgets/quiz_page_widgets/question_image.dart';

class QuizPage extends StatefulWidget {
  const QuizPage(
      {super.key, required this.difficulty, required this.categoryId});
  @override
  State<QuizPage> createState() => _QuizPageState();
  final String difficulty;
  final int categoryId;
}

class _QuizPageState extends State<QuizPage> {
  List<String> choices = [];
  String type = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Provider.of<QuestionsController>(context, listen: false).startTimer();
    Provider.of<QuestionsController>(context, listen: false).getQuestionsList(
        difficulty: widget.difficulty, categoryId: widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer<QuestionsController>(
        builder: (context, controller, child) {
          String decodedChoice = "";
          if (controller.questionList.isNotEmpty) {
            decodedChoice = HtmlUnescape().convert(controller.questionList[controller.questionIndex].correctAnswer);
            choices = controller.questionList[controller.questionIndex]
                .shuffleChoices();
            type = controller.questionList[controller.questionIndex].type;
            QuestionsController.correctChoices.add(decodedChoice.trim());
          }

          return Scaffold(
              appBar: AppBar(
                title: Text("Question: ${controller.questionIndex+1}/10"),
                centerTitle: true,
                automaticallyImplyLeading: false,
                backgroundColor: Theme
                    .of(context)
                    .cardColor,
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          top: 20, left: 20, right: 20),
                      padding: const EdgeInsets.all(20),
                      height: size.height * 0.55,
                      width: size.width,
                      decoration: BoxDecoration(
                          color: Theme
                              .of(context)
                              .cardColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          const QuestionImage(),
                          QuizQuestion(
                              question: controller.questionList.isNotEmpty
                                  ? controller.questionList[controller
                                  .questionIndex].question
                                  : "Loading...")
                        ],
                      ),
                    ),
                    controller.questionList.isEmpty
                        ? CircularProgressIndicator(
                      color: Theme
                          .of(context)
                          .cardColor,
                    )
                        : Container(
                        margin: const EdgeInsets.only(left: 20),
                        height: size.height / 4.3,
                        child: AnswerChoices(
                          type: type, choices: choices, selectionCount: 0,)),
                    const NextQuestionButton()
                  ],
                ),
              )
          );
        }
    );
  }

  // Widget _timerWidget(QuestionsController controller) {
  //   return SizedBox(
  //     width: 50,
  //     height: 50,
  //     child: Stack(
  //       alignment: Alignment.center,
  //       children: [
  //         CircularProgressIndicator(
  //           value: controller.remainingTime / 10, // Assuming 60 seconds for each question
  //           backgroundColor: Colors.red,
  //           valueColor: const AlwaysStoppedAnimation<Color>(Colors.purple),
  //         ),
  //         Text(
  //           '${controller.remainingTime}',
  //           style: const TextStyle(
  //             color: Colors.white,
  //             fontSize: 16,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

}

