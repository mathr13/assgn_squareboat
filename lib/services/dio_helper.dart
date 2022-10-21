import 'package:dio/dio.dart';

class APIHelper {
  late Dio dio;
  APIHelper() {
    dio = Dio()
      ..options = BaseOptions(
        headers: {}
      );
  }

  // ItemRestClient getDioItemClient() => ItemRestClient(dio);
}