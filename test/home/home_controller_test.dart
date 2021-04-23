import 'package:dev_quiz/shared/models/quiz_model.dart';
import 'package:dev_quiz/home/home_state.dart';
import 'package:dev_quiz/shared/models/user_model.dart';
import 'package:dev_quiz/home/home_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  HomeController controller = HomeController();

  group("HomeController", () {
    test("test function getUser", () {
      expect(controller.user, null);

      controller.getUser();

      if (controller.state == HomeState.success) {
        expect(controller.user, isA<UserModel>());
      }
    });
    test("test function getQuizzes", () {
      expect(controller.quizzes, null);

      controller.getQuizzes();

      if (controller.state == HomeState.success) {
        expect(controller.quizzes, isA<QuizModel>());
      }
    });
  });
}
