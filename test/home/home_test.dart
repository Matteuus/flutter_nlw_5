import 'package:dev_quiz/repository/home/home_repository.dart';
import 'package:dev_quiz/shared/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  Dio dio = Dio();
  DioAdapter dioAdapter = DioAdapter();
  HomeRepository homeRepository = HomeRepository();

  Map<String, dynamic> data;

  group("HomeController / Repository", () {
    setUpAll(() {
      dio = Dio()..httpClientAdapter = dioAdapter;
    });

    test("testa se retorna um user da chamada http", () async {
      data = {
        "id": "1",
        "name": "Mateus",
        "score": 90,
        "photoUrl": "https://avatars.githubusercontent.com/u/23088063?v=4"
      };

      dioAdapter.onGet("/users/1", (request) => request.reply(200, data));

      expect(await homeRepository.getUser(dio), isA<UserModel>());
    });

    test("testa se retorna um erro da chamada http", () async {
      final dioError = DioError(
          error: "Not Found",
          requestOptions: RequestOptions(path: "/users/1"),
          response: Response(
              statusCode: 404,
              requestOptions: RequestOptions(path: "/users/1")),
          type: DioErrorType.response);

      dioAdapter.onGet("/users/1", (request) => request.throws(404, dioError));

      expect(homeRepository.getUser(dio), throwsA(isA<DioError>()));
    });
  });
}
