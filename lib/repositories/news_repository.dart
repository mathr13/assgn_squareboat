import 'package:assgn_news_squareboat/models/news_response.dart';
import 'package:dartz/dartz.dart';

import '../services/failure_helper.dart';
import '../services/news_rest_client.dart';

abstract class NewsRepository {

  Future<Either<Failure, NewsResponse>> getTopHeadlines();

}

class NewsRepositoryImpl implements NewsRepository {

  final NewsRestClient client;

  NewsRepositoryImpl(this.client);
  
  @override
  Future<Either<Failure, NewsResponse>> getTopHeadlines() async {
    try {
      var response = await client.getHeadlines(
        "9f9b059b05b8442da7318d9e3ffbb2a0"
      );
      return Right(response);
    } catch (e) {
      return Left(Failure.fromServerError(e));
    }
  }

}