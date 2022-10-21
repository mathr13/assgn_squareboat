import 'package:assgn_news_squareboat/services/news_rest_client.dart';
import 'package:dio/dio.dart';

class DioHelper {
  late Dio dio;
  DioHelper() {
    dio = Dio()
      ..options = BaseOptions(
        headers: {}
      );
  }

  NewsRestClient getDioNewsClient() => NewsRestClient(dio);
}