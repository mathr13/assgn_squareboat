import 'package:assgn_news_squareboat/models/news_response.dart';
import 'package:dartz/dartz.dart';

import '../models/source_response.dart';
import '../services/failure_helper.dart';
import '../services/news_rest_client.dart';

abstract class NewsRepository {

  Future<Either<Failure, NewsResponse>> getTopHeadlines(String country, {String? query, List<String>? sources, String? category, String? sortBy, String? pageSize, String? page});
  Future<Either<Failure, SourcesResponse>> getAllSourcesForRegion(String country);

}

class NewsRepositoryImpl implements NewsRepository {

  final NewsRestClient client;

  NewsRepositoryImpl(this.client);
  
  @override
  Future<Either<Failure, NewsResponse>> getTopHeadlines(String country, {String? query, List<String>? sources, String? category, String? sortBy, String? pageSize, String? page}) async {
    try {
      // var response = await client.getHeadlines(
      //   "9f9b059b05b8442da7318d9e3ffbb2a0"
      // );
      var response = await client.fetchHeadlines("9f9b059b05b8442da7318d9e3ffbb2a0", sources: sources, country: country, sortBy: sortBy);
      return Right(response);
    } catch (e) {
      return Left(Failure.fromServerError(e));
    }
  }

  @override
  Future<Either<Failure, SourcesResponse>> getAllSourcesForRegion(String country) async {
    try {
      var response = await client.fetchSourcesForLocation("9f9b059b05b8442da7318d9e3ffbb2a0", country);
      return Right(response);
    } catch (e) {
      return Left(Failure.fromServerError(e));
    }
  }

}