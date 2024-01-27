import 'package:flutter/material.dart';
import 'package:learningapp/models/category.dart';
import 'package:learningapp/pages/quiz_level_page.dart';
import 'package:learningapp/services/api_services/trivia_category.dart';

class CategoryGrid extends StatefulWidget {
  const CategoryGrid({
    super.key,
  });

  @override
  State<CategoryGrid> createState() => _CategoryGridState();
}

class _CategoryGridState extends State<CategoryGrid> {
  CategoryApi apiService = CategoryApi();

  late List<Category> categories = [];
  @override
  void initState() {
    super.initState();
    getCategories();
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: categories.isEmpty
          ? Center(child: CircularProgressIndicator(
        color: Theme.of(context).primaryColor,
      ))
          : GridView.builder(
              //Category Grid View
              itemCount: categories.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: size.width/2),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuizLevelPage(
                                  category: categories[index]
                                )));
                  },
                  child: Hero(
                    tag: "${categories[index].id}",
                    child: Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                            child: Text(
                          categories[index].name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Theme.of(context).indicatorColor,
                              fontWeight: FontWeight.normal, fontSize: 18),
                        ))),
                  ),
                );
              }),
    );
  }

  getCategories() async {
    categories = await apiService.getCategories();
    setState(() {});
  }
}
