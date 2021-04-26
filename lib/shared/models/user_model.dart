import 'dart:convert';

class UserModel {
  final String id;
  final String name;
  final String photoUrl;
  final int score;

  UserModel(
      {required this.id,
      required this.name,
      required this.photoUrl,
      this.score = 0});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'photoUrl': photoUrl,
      'score': score,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      photoUrl: map['photoUrl'],
      score: map['score'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(Map doc) {
    return UserModel(
        id: doc['id'],
        name: doc['name'],
        photoUrl: doc['photoUrl'],
        score: doc['score']);
  }
}
