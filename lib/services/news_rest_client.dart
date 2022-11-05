import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/news_response.dart';
import '../models/source_response.dart';
import 'api_endpoints.dart';

part 'news_rest_client.g.dart';

@RestApi()
abstract class NewsRestClient {

  factory NewsRestClient(Dio dio) = _NewsRestClient;

  @GET(EndpointsBaseUrls.topHeadlines)
  Future<NewsResponse> fetchHeadlines(@Path("apiKey") String apiKey, {@Query("q") String? query, @Query("sources") String? sources, @Query("country") String? country, @Query("category") String? category, @Query("sortBy") String? sortBy, @Query("pageSize") int? pageSize, @Query("page") int? page});

  @GET(EndpointsBaseUrls.sources)
  Future<SourcesResponse> fetchSourcesForLocation(@Path("apiKey") String apiKey, @Query("country") String country);

  @GET(EndpointsBaseUrls.everything)
  Future<NewsResponse> fetchEverything(@Path("apiKey") String apiKey, {@Query("q") required String query, @Query("sources") String? sources, @Query("country") String? country, @Query("from") String? from, @Query("to") String? to, @Query("sortBy") String? sortBy, @Query("pageSize") int? pageSize, @Query("page") int? page});

}