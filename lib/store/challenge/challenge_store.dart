import 'package:mobx/mobx.dart';
part 'challenge_store.g.dart';

class ChallengeStore = _ChallengeStoreBase with _$ChallengeStore;

abstract class _ChallengeStoreBase with Store {
  @observable
  int currentPage = 0;

  @observable
  int correctAwnsers = 0;

  @action
  setCurrentPage(int value) {
    currentPage = value;
  }

  @action
  finishChallenge() {
    currentPage = 0;
    correctAwnsers = 0;
  }
}
