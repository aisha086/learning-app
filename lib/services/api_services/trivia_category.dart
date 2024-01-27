import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/category.dart';

class CategoryApi{

  String categoryBaseUrl = "https://opentdb.com/api_category.php";
  Future<List<Category>> getCategories() async{
    try{
      var response = await http.get(Uri.parse(categoryBaseUrl));

      if(response.statusCode == 200){
        var json = jsonDecode(response.body);
        print(json);
        final jsonData = json['trivia_categories'] as List<dynamic>;
        List<Category> categories = jsonData.map((e) => Category.fromJson(e)).toList();
        return categories;
      }
      else{
        return Future.error("Server Error");
      }
    }
    catch(socketException) {
      return Future.error("Error Fetching Data");

    }
  }
}