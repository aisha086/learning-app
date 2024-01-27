import 'package:flutter/material.dart';
import 'package:learningapp/controller/questions_controller.dart';
import 'package:learningapp/widgets/view_answers_widgets/view_only_choices.dart';
import 'package:learningapp/widgets/view_answers_widgets/view_only_next_button.dart';
import 'package:provider/provider.dart';

import '../widgets/quiz_page_widgets/question_image.dart';
import '../widgets/quiz_page_widgets/quiz_question.dart';

class ViewAnswersPage extends StatefulWidget {
  const ViewAnswersPage({super.key});

  @override
  State<ViewAnswersPage> createState() => _ViewAnswersPageState();
}

class _ViewAnswersPageState extends State<ViewAnswersPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String>choices = Provider.of<QuestionsController>(context)
        .questionList[
    Provider.of<QuestionsController>(context)
        .questionIndex].shuffleChoices();
    String type = Provider.of<QuestionsController>(context)
        .questionList[
    Provider.of<QuestionsController>(context)
        .questionIndex].type;
    int questionIndex = Provider.of<QuestionsController>(context).questionIndex;

    return Scaffold(
        appBar: AppBar(
          title: Text(
              "Question: ${questionIndex + 1}/10"),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).cardColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                padding: const EdgeInsets.all(20),
                height: size.height * 0.55,
                width: size.width,
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    const QuestionImage(),
                    QuizQuestion(
                        question: Provider.of<QuestionsController>(context)
                            .questionList[
                                Provider.of<QuestionsController>(context)
                                    .questionIndex]
                            .question)
                  ],
                ),
              ),
              Container(
                      margin: const EdgeInsets.only(left: 20),
                      height: size.height / 4.3,
                      child: ViewAnswerChoices(
                        type: type,
                        choices: choices,
                        questionIndex: questionIndex,
                      )
              ),
              const ViewOnlyNextButton()
            ],
          ),
        ));
  }
}
