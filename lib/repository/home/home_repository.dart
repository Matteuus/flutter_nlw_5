import 'package:dev_quiz/shared/models/quiz_model.dart';
import 'package:dev_quiz/shared/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

class HomeRepository {
  Future<UserModel> getUser(Dio dio) async {
    Response response = await dio.get("/users/1");
    if (response.statusCode != 200) {
      return throw Exception("Falha ao retornar usuário");
    } else {
      return UserModel.fromJson(response.data);
    }
  }

  Future<ObservableList<QuizModel>> getQuizzes(Dio dio) async {
    Response response = await dio.get("/quizzes");
    final list = response.data as List;
    final quizzes = list.map((e) => QuizModel.fromMap(e)).toList();
    if (response.statusCode != 200) {
      return throw Exception("Falha ao retornar Quiz");
    } else {
      ObservableList<QuizModel> observableQuizzes = ObservableList();
      quizzes.forEach((element) {
        observableQuizzes.add(element);
      });
      return observableQuizzes;
    }
  }
}
