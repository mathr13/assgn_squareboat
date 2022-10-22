import 'package:dio/dio.dart';
// import 'package:retrofit/retrofit.dart';

import '../models/news_response.dart';
import '../models/source_response.dart';
import 'api_endpoints.dart';

// @RestApi()
class NewsRestClient {

  final Dio dio;

  NewsRestClient(this.dio);

  Future<NewsResponse> fetchHeadlines(String apiKey, {String? query, List<String>? sources, String? country, String? category, String? sortBy, String? pageSize, String? page}) async {
    String url = EndpointsBaseUrls.topHeadlines;
    url += getUrlQueryForAttribute("language", "en");
    url += getUrlQueryForAttribute("apiKey", apiKey);
    url += getUrlQueryForAttribute("query", query);
    sources?.forEach((source) {
      url += getUrlQueryForAttribute("sources", source);
      url += ",";
    });
    if(url.endsWith(",")) url = url.substring(0, url.length-1);
    url += getUrlQueryForAttribute("country", country);
    url += getUrlQueryForAttribute("category", category);
    url += getUrlQueryForAttribute("sortBy", sortBy);
    url += getUrlQueryForAttribute("pageSize", pageSize);
    url += getUrlQueryForAttribute("page", page);
    url = url.substring(0, url.length-1);
    var response = await dio.get(url);
    return NewsResponse.fromJson(response.data);
  }

  Future<SourcesResponse> fetchSourcesForLocation(String apiKey, String country) async {
    String url = EndpointsBaseUrls.sources;
    url += getUrlQueryForAttribute("language", "en");
    url += getUrlQueryForAttribute("apiKey", apiKey);
    url += getUrlQueryForAttribute("country", country);
    var response = await dio.get(url);
    return SourcesResponse.fromJson(response.data);
  }

  Future<NewsResponse> fetchEverything(String apiKey, {required String query, List<String>? sources, String? country, String? from, String? to, String? sortBy, String? pageSize, String? page}) async {
    String url = EndpointsBaseUrls.everything;
    url += getUrlQueryForAttribute("language", "en");
    url += getUrlQueryForAttribute("apiKey", apiKey);
    url += getUrlQueryForAttribute("q", query);
    sources?.forEach((source) {
      url += getUrlQueryForAttribute("sources", source);
      url += ",";
    });
    if(url.endsWith(",")) url = url.substring(0, url.length-1);
    url += getUrlQueryForAttribute("country", country);
    url += getUrlQueryForAttribute("sortBy", sortBy);
    url += getUrlQueryForAttribute("pageSize", pageSize);
    url += getUrlQueryForAttribute("page", page);
    url = url.substring(0, url.length-1);
    var response = await dio.get(url);
    return NewsResponse.fromJson(response.data);
  }

}

extension RestUtilities on NewsRestClient {

  String getUrlQueryForAttribute(String key, String? value) {
    return value == null ? "" : "$key=$value&";
  }

}