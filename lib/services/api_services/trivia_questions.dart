import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learningapp/models/question.dart';

class QuestionsApi{

  Future<List<Question>> getQuestions({int amount = 10,required int category, required String difficulty}) async {
    try {
      final url = Uri.parse('https://opentdb.com/api.php?amount=$amount&category=$category&difficulty=$difficulty');

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body)['results'];
        List<Question> questions = jsonList.map((json) => Question.fromJson(json)).toList();
        return questions;
      } else {
        throw Exception('Failed to load trivia questions');
      }
    } catch (error) {
      // Handle exceptions
      throw Exception('Failed to load trivia questions');
    }
  }
}