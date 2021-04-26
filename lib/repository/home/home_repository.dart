import 'package:dev_quiz/shared/models/quiz_model.dart';
import 'package:dev_quiz/shared/models/user_model.dart';
import 'package:dio/dio.dart';

class HomeRepository {
  final Dio _dio = Dio();
  String baseUrl = "https://6080da8f73292b0017cdc1dd.mockapi.io";

  Future<UserModel> getUser() async {
    Response response = await _dio.get("$baseUrl/users/1");
    if (response.statusCode != 200) {
      throw Exception();
    } else {
      return UserModel.fromJson(response.data);
    }
  }

  Future<List<QuizModel>> getQuizzes() async {
    Response response = await _dio.get("$baseUrl/quizzes");
    final list = response.data as List;
    final quizzes = list.map((e) => QuizModel.fromMap(e)).toList();
    return quizzes;
  }
}
