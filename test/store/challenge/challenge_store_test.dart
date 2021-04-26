import 'package:flutter_test/flutter_test.dart';
import 'package:dev_quiz/store/challenge/challenge_store.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group("ChallengeStore", () {
    test("test if pages modifies", () {
      ChallengeStore controller = ChallengeStore();

      expect(controller.currentPage, 0);
      controller.setCurrentPage(2);
      expect(controller.currentPage, 2);
    });
    test("test correct awnsers", () {
      ChallengeStore controller = ChallengeStore();

      expect(controller.correctAwnsers, 0);
      controller.correctAwnsers++;
      expect(controller.correctAwnsers, 1);
    });
  });
}
