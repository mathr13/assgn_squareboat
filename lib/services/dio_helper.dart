import 'package:assgn_news_squareboat/services/news_rest_client.dart';
import 'package:dio/dio.dart';
import 'package:dio_logger/dio_logger.dart';

class DioHelper {
  late Dio dio;
  DioHelper() {
    dio = Dio()
      ..options = BaseOptions(
        headers: {}
      )
      ..interceptors.add(dioLoggerInterceptor);
  }

  NewsRestClient getDioNewsClient() => NewsRestClient(dio);
}