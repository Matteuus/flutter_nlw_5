// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  final _$userAtom = Atom(name: '_HomeStoreBase.user');

  @override
  UserModel? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$quizzesAtom = Atom(name: '_HomeStoreBase.quizzes');

  @override
  List<QuizModel>? get quizzes {
    _$quizzesAtom.reportRead();
    return super.quizzes;
  }

  @override
  set quizzes(List<QuizModel>? value) {
    _$quizzesAtom.reportWrite(value, super.quizzes, () {
      super.quizzes = value;
    });
  }

  final _$repositoryAtom = Atom(name: '_HomeStoreBase.repository');

  @override
  HomeRepository get repository {
    _$repositoryAtom.reportRead();
    return super.repository;
  }

  @override
  set repository(HomeRepository value) {
    _$repositoryAtom.reportWrite(value, super.repository, () {
      super.repository = value;
    });
  }

  final _$getUserAsyncAction = AsyncAction('_HomeStoreBase.getUser');

  @override
  Future getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  final _$getQuizzesAsyncAction = AsyncAction('_HomeStoreBase.getQuizzes');

  @override
  Future getQuizzes() {
    return _$getQuizzesAsyncAction.run(() => super.getQuizzes());
  }

  @override
  String toString() {
    return '''
user: ${user},
quizzes: ${quizzes},
repository: ${repository}
    ''';
  }
}
