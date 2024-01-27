import 'package:flutter/material.dart';
import 'package:learningapp/widgets/home_page_widgets/category_grid.dart';
import 'package:learningapp/widgets/home_page_widgets/search_results_grid.dart';
import 'package:learningapp/widgets/home_page_widgets/top_row.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  List<Map<String, dynamic>> displayedCategories = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeTopRow(),
            Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Categories",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                              hintText: 'Search category',
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.cancel),
                                onPressed: () {
                                    setState(() {
                                      _searchController.clear();
                                      displayedCategories.clear();
                                    });
                                },
                              )),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _searchCategory(context, _searchController.text);
                        },
                        style: const ButtonStyle(
                          minimumSize: MaterialStatePropertyAll(Size(40,40)),
                          shape: MaterialStatePropertyAll(CircleBorder())
                        ),
                        child: const Icon(Icons.search),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: displayedCategories.isNotEmpty
                  ? SearchResultsGrid(displayedCategories: displayedCategories)
                  : const CategoryGrid(),
            )
          ],
        ),
      ),
    );
  }

  void _searchCategory(BuildContext scaffoldContext, String category) {
    // List of available categories
    final List<Map<String, dynamic>> availableCategories = [
      {"id": 9, "name": "General Knowledge"},
      {"id": 10, "name": "Entertainment: Books"},
      {"id": 11, "name": "Entertainment: Film"},
      {"id": 12, "name": "Entertainment: Music"},
      {"id": 13, "name": "Entertainment: Musicals & Theatres"},
      {"id": 14, "name": "Entertainment: Television"},
      {"id": 15, "name": "Entertainment: Video Games"},
      {"id": 16, "name": "Entertainment: Board Games"},
      {"id": 17, "name": "Science & Nature"},
      {"id": 18, "name": "Science: Computers"},
      {"id": 19, "name": "Science: Mathematics"},
      {"id": 20, "name": "Mythology"},
      {"id": 21, "name": "Sports"},
      {"id": 22, "name": "Geography"},
      {"id": 23, "name": "History"},
      {"id": 24, "name": "Politics"},
      {"id": 25, "name": "Art"},
      {"id": 26, "name": "Celebrities"},
      {"id": 27, "name": "Animals"},
      {"id": 28, "name": "Vehicles"},
      {"id": 29, "name": "Entertainment: Comics"},
      {"id": 30, "name": "Science: Gadgets"},
      {"id": 31, "name": "Entertainment: Japanese Anime & Manga"},
      {"id": 32, "name": "Entertainment: Cartoon & Animations"},
    ];
    List<Map<String, dynamic>> results = availableCategories
        .where(
            (cat) => cat['name'].toLowerCase().contains(category.toLowerCase()))
        .map((cat) => cat)
        .toList();
    setState(() {
      displayedCategories = results;
    });
    if (results.isEmpty) {
      // Show an error message
      ScaffoldMessenger.of(scaffoldContext).showSnackBar(
        const SnackBar(
          content: Text(
            'Oops! Category not available',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }
  }
}
