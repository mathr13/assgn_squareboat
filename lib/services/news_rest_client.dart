import 'package:assgn_news_squareboat/services/api_endpoints.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/news_response.dart';

part 'news_rest_client.g.dart';

@RestApi()
abstract class NewsRestClient {
  
  factory NewsRestClient(Dio dio) = _NewsRestClient;

  @GET(Endpoints.fetchAllNewsArticles)
  Future<NewsResponse> getAllNews();

}