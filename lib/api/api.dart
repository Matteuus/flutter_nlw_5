import 'package:dio/dio.dart';

class Api {
  static var options = BaseOptions(
      baseUrl: "https://6080da8f73292b0017cdc1dd.mockapi.io",
      connectTimeout: 5000,
      receiveTimeout: 3000);
  static final Dio dio = Dio(options);
}
