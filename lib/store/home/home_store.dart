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
    quizzesNivel = ObservableList();
  }

  @observable
  UserModel? user;

  @observable
  ObservableList<QuizModel>? quizzes;

  @observable
  ObservableList<QuizModel>? quizzesNivel;

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

  @action
  getQuizzesNivel(String nivel) async {
    try {
      if (quizzesNivel!.isNotEmpty) {
        quizzesNivel!.forEach((element) {
          if (element.level.parse == nivel) {
            quizzesNivel!.clear();
            return;
          }
        });
        quizzesNivel!.clear();
      }
      if (quizzes != null) {
        quizzes!.forEach((element) {
          if (element.level.parse == nivel) quizzesNivel!.add(element);
        });
      }
    } catch (Exception) {
      print(Exception);
    }
  }
}
