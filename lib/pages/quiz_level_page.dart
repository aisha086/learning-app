import 'package:flutter/material.dart';
import 'package:learningapp/models/category.dart';
import 'package:learningapp/widgets/quiz_level-page_widgets/category_desc.dart';
import 'package:learningapp/widgets/quiz_level-page_widgets/lets_go_button.dart';
import 'package:learningapp/widgets/quiz_level-page_widgets/level_button.dart';


class QuizLevelPage extends StatefulWidget {
  const QuizLevelPage({super.key, required this.category});
  final Category category;

  @override
  State<QuizLevelPage> createState() => _QuizLevelPageState();
}

class _QuizLevelPageState extends State<QuizLevelPage> {

  bool isEasySelected = false;
  bool isMediumSelected = false;
  bool isHardSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
      ),
      body: Column(
        children: [
          CategoryDesc(category: widget.category),
          Container(
            margin: const EdgeInsets.all(30),
            child: Column(
              children: [
                const Text(
                  "Difficulty Level",
                  style: TextStyle(fontSize: 24),
                ),
                LevelButton(
                  level: "Easy",
                  onPressed: () => onPressedButton(
                      isSelected: isEasySelected, level: "Easy"),
                  isSelected: isEasySelected,
                ),
                LevelButton(
                  level: "Medium",
                  onPressed: () => onPressedButton(
                      isSelected: isMediumSelected, level: "Medium"),
                  isSelected: isMediumSelected,
                ),
                LevelButton(
                  level: "Hard",
                  onPressed: () => onPressedButton(
                      isSelected: isHardSelected, level: "Hard"),
                  isSelected: isHardSelected,
                ),
                LetsGoButton(categoryId: widget.category.id,difficulty: setDifficulty(),)
              ],
            ),
          )
        ],
      ),
    );
  }

  String setDifficulty(){
    if(isEasySelected) {
      return "easy";
    }
    else if(isMediumSelected) {
      return "medium";
    }
    else if(isHardSelected){
      return "hard";
    }
    return "none";
  }
  onPressedButton({required bool isSelected, required String level}) {
    setState(() {
      switch (level) {
        case "Easy":
          isEasySelected = !isEasySelected;
          isMediumSelected = false;
          isHardSelected = false;
          break;
        case "Medium":
          isEasySelected = false;
          isMediumSelected = !isMediumSelected;
          isHardSelected = false;
          break;
        case "Hard":
          isEasySelected = false;
          isMediumSelected = false;
          isHardSelected = !isHardSelected;
          break;
      }
    });
  }
}
