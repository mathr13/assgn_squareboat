import 'package:assgn_news_squareboat/services/api_endpoints.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/news_response.dart';

part 'news_rest_client.g.dart';

@RestApi()
abstract class NewsRestClient {

  factory NewsRestClient(Dio dio) = _NewsRestClient;

  @GET(Endpoints.topHeadlines)
  Future<NewsResponse> getHeadlines(
    @Path("apiKey") String apiKey,
    {
      @Path("query") String? query,
      @Path("sources") String? sources,
      @Path("country") String? country,
      @Path("category") String? category,
      @Path("sortBy") String? sortBy,
      @Path("pageSize") String? pageSize,
      @Path("page") String? page,
    }
  );

  @GET(Endpoints.everything)
  Future<NewsResponse> getEverything(
    @Path("apiKey") String apiKey,
    {
      @Path("query") String? query,
      @Path("sources") String? sources,
      @Path("fromDate") String? fromDate,
      @Path("toDate") String? toDate,
      @Path("sortBy") String? sortBy,
      @Path("pageSize") String? pageSize,
      @Path("page") String? page,
    }
  );

}