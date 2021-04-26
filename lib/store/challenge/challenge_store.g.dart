// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChallengeStore on _ChallengeStoreBase, Store {
  final _$currentPageAtom = Atom(name: '_ChallengeStoreBase.currentPage');

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  final _$correctAwnsersAtom = Atom(name: '_ChallengeStoreBase.correctAwnsers');

  @override
  int get correctAwnsers {
    _$correctAwnsersAtom.reportRead();
    return super.correctAwnsers;
  }

  @override
  set correctAwnsers(int value) {
    _$correctAwnsersAtom.reportWrite(value, super.correctAwnsers, () {
      super.correctAwnsers = value;
    });
  }

  final _$_ChallengeStoreBaseActionController =
      ActionController(name: '_ChallengeStoreBase');

  @override
  dynamic setCurrentPage(int value) {
    final _$actionInfo = _$_ChallengeStoreBaseActionController.startAction(
        name: '_ChallengeStoreBase.setCurrentPage');
    try {
      return super.setCurrentPage(value);
    } finally {
      _$_ChallengeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPage: ${currentPage},
correctAwnsers: ${correctAwnsers}
    ''';
  }
}
