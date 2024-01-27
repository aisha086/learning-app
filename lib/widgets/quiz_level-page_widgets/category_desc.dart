import 'package:flutter/material.dart';
import 'package:learningapp/models/category.dart';

class CategoryDesc extends StatelessWidget {
  const CategoryDesc({Key? key, required this.category}) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Hero(
      tag: "${category.id}",
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(size.width/2, size.width/8)),
            color: Theme.of(context).cardColor
        ),
        height: size.height/2.5,
        child: Center(
          child: Text(
            category.name,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Theme.of(context).indicatorColor,
                fontSize: 34
            ),
          ),
        ),
      ),
    );
  }
}
