import 'package:flutter_test/flutter_test.dart';
import 'package:dev_quiz/store/challenge/challenge_store.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group("ChallengeStore", () {
    test("testa a variavel para modificar a página", () {
      ChallengeStore controller = ChallengeStore();

      expect(controller.currentPage, 1);
      controller.setCurrentPage(2);
      expect(controller.currentPage, 2);
    });
    test("testa a variável de quantidade de questões corretas", () {
      ChallengeStore controller = ChallengeStore();

      expect(controller.correctAwnsers, 0);
      controller.correctAwnsers++;
      expect(controller.correctAwnsers, 1);
    });
  });
}
