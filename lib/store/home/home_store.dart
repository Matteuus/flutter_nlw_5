import 'package:dev_quiz/pages/home/home_repository.dart';
import 'package:dev_quiz/shared/models/quiz_model.dart';
import 'package:dev_quiz/shared/models/user_model.dart';
import 'package:dev_quiz/store/home/home_state.dart';
import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  _HomeStoreBase() {
    getUser();
    getQuizzes();
  }

  @observable
  HomeState state = HomeState.empty;

  @observable
  UserModel? user;

  @observable
  List<QuizModel>? quizzes;

  @observable
  HomeRepository repository = HomeRepository();

  @action
  getUser() async {
    state = HomeState.loading;
    try {
      user = await repository.getUser();
      state = HomeState.success;
    } catch (Exception) {
      print(Exception);
      state = HomeState.error;
    }
  }

  @action
  getQuizzes() async {
    state = HomeState.loading;
    try {
      quizzes = await repository.getQuizzes();
      state = HomeState.success;
    } catch (Exception) {
      print(Exception);
      state = HomeState.error;
    }
  }
}
