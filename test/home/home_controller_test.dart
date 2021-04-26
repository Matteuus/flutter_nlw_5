import 'package:dev_quiz/store/home/home_state.dart';
import 'package:dev_quiz/shared/models/quiz_model.dart';
import 'package:dev_quiz/shared/models/user_model.dart';
import 'package:dev_quiz/store/home/home_store.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group("HomeController", () {
    test("test function getUser", () {
      final HomeStore controller = HomeStore();
      expect(controller.user, null);

      controller.getUser();

      if (controller.state == HomeState.success) {
        expect(controller.user, isA<UserModel>());
      }
    });
    test("test function getQuizzes", () {
      final HomeStore controller = HomeStore();
      expect(controller.quizzes, null);

      controller.getQuizzes();

      if (controller.state == HomeState.success) {
        expect(controller.quizzes, isA<QuizModel>());
      }
    });
  });
}
