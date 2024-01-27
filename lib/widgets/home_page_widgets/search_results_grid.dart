import 'package:flutter/material.dart';

import '../../models/category.dart';
import '../../pages/quiz_level_page.dart';

class SearchResultsGrid extends StatelessWidget {
  const SearchResultsGrid({super.key, required this.displayedCategories});
  final List<Map<String,dynamic>> displayedCategories;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        //Category Grid View
          itemCount: displayedCategories.length,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: size.width / 2),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QuizLevelPage(
                            category: Category(
                                id: displayedCategories[index]['id'],
                                name: displayedCategories[index]['name']))));
              },
              child: Hero(
                tag: "${displayedCategories[index]['id']}",
                child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Text(
                          displayedCategories[index]['name'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Theme.of(context).indicatorColor,
                              fontWeight: FontWeight.normal,
                              fontSize: 18),
                        ))),
              ),
            );
          }),
    );
  }
}

