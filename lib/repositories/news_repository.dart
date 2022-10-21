import 'package:assgn_news_squareboat/models/news_response.dart';
import 'package:dartz/dartz.dart';

import '../services/failure_helper.dart';
import '../services/news_rest_client.dart';

abstract class NewsRepository {

  Future<Either<Failure, NewsResponse>> getNewsAtricles();

}

class NewsRepositoryImpl implements NewsRepository {

  final NewsRestClient client;

  NewsRepositoryImpl(this.client);
  
  @override
  Future<Either<Failure, NewsResponse>> getNewsAtricles() async {
    try {
      var response = await client.getAllNews();
      return Right(response);
    } catch (e) {
      return Left(Failure.fromServerError(e));
    }
  }

}