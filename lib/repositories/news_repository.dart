import 'package:assgn_news_squareboat/models/news_response.dart';
import 'package:dartz/dartz.dart';

import '../models/source_response.dart';
import '../services/failure_helper.dart';
import '../services/news_rest_client.dart';

abstract class NewsRepository {

  Future<Either<Failure, NewsResponse>> getTopHeadlines(String apiKey, String country, {String? query, List<String>? sources, String? category, String? sortBy, String? pageSize, String? page});
  Future<Either<Failure, SourcesResponse>> getAllSourcesForRegion(String apiKey, String country);
  Future<Either<Failure, NewsResponse>> getEverythingFor(String apiKey, String country, {required String query, List<String>? sources, String? from, String? to, String? sortBy, String? pageSize, String? page});

}

class NewsRepositoryImpl implements NewsRepository {

  final NewsRestClient client;

  NewsRepositoryImpl(this.client);
  
  @override
  Future<Either<Failure, NewsResponse>> getTopHeadlines(String apiKey, String country, {String? query, List<String>? sources, String? category, String? sortBy, String? pageSize, String? page}) async {
    try {
      var response = await client.fetchHeadlines(apiKey, sources: sources, country: country, sortBy: sortBy);
      return Right(response);
    } catch (e) {
      return Left(Failure.fromServerError(e));
    }
  }

  @override
  Future<Either<Failure, SourcesResponse>> getAllSourcesForRegion(String apiKey, String country) async {
    try {
      var response = await client.fetchSourcesForLocation(apiKey, country);
      return Right(response);
    } catch (e) {
      return Left(Failure.fromServerError(e));
    }
  }
  
  @override
  Future<Either<Failure, NewsResponse>> getEverythingFor(String apiKey, String country, {required String query, List<String>? sources, String? from, String? to, String? sortBy, String? pageSize, String? page}) async {
    try {
      var response = await client.fetchEverything(apiKey, query: query);
      return Right(response);
    } catch (e) {
      return Left(Failure.fromServerError(e));
    }
  }

}