import 'package:assgn_news_squareboat/constants/constant_values.dart';
import 'package:dio/dio.dart';

class Failure {
  late String message;
  late int statusCode;
  dynamic response;

  Failure({required this.message, required this.response, required this.statusCode});

  Failure.fromServerError(dynamic error) {
    switch (error.runtimeType) {
      case DioError:
        try {
          final res = (error as DioError).response;
          statusCode = res?.statusCode ?? 0;
          message = res?.data['message'] ?? res?.data['error_messages'][0] ?? SBDisplayLabels.somethingwentwrong;
        } catch (e) {
          message = SBDisplayLabels.somethingwentwrong;
          if (message == SBDisplayLabels.nointernetConnection) statusCode = 101;
        }
        break;
      default:
        message = SBDisplayLabels.unknownerror;
    }
  }
}
