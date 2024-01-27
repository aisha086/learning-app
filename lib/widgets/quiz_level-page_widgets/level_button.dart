import 'package:flutter/material.dart';

class LevelButton extends StatefulWidget {
  const LevelButton({Key? key, required this.level,required this.onPressed,required this.isSelected}) : super(key: key);
  final VoidCallback onPressed;
  final String level;
  final bool isSelected;

  @override
  State<LevelButton> createState() => _LevelButtonState();
}

class _LevelButtonState extends State<LevelButton> {
  @override
  Widget build(BuildContext context) {

    Color selectedColor = Theme.of(context).primaryColor;
    Color notSelectedColor = Theme.of(context).cardColor;
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(Size(size.width/2, 50)),
          backgroundColor: MaterialStateProperty.all(widget.isSelected?selectedColor:notSelectedColor)
        ),
        child: SizedBox(
          width: size.width/2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.level),
              Icon(setIcon())
            ],
          ),
        ),
      ),
    );
  }

  IconData setIcon(){
    if(widget.level == "Hard"){
      return Icons.accessible_forward;
    }
    else if(widget.level == "Medium"){
      return Icons.directions_walk;
    }
    return Icons.directions_run;
  }
}
