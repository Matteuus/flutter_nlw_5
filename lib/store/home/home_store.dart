import 'package:dev_quiz/api/api.dart';
import 'package:dev_quiz/repository/home/home_repository.dart';
import 'package:dev_quiz/shared/models/quiz_model.dart';
import 'package:dev_quiz/shared/models/user_model.dart';
import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  _HomeStoreBase() {
    getUser();
    getQuizzes();
  }

  @observable
  UserModel? user;

  @observable
  List<QuizModel>? quizzes;

  @observable
  HomeRepository repository = HomeRepository();

  @action
  getUser() async {
    try {
      user = await repository.getUser(Api.dio);
    } catch (Exception) {
      print(Exception);
    }
  }

  @action
  getQuizzes() async {
    try {
      quizzes = await repository.getQuizzes(Api.dio);
    } catch (Exception) {
      print(Exception);
    }
  }
}
