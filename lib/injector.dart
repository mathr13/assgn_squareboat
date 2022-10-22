import 'package:assgn_news_squareboat/controllers/news_controller.dart';
import 'package:assgn_news_squareboat/repositories/news_repository.dart';
import 'package:assgn_news_squareboat/services/dio_helper.dart';
import 'package:assgn_news_squareboat/utilities/navigation_utility.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import 'services/news_rest_client.dart';

var getIt = GetIt.I;

inject() {

  getIt.registerLazySingleton<NewsRepository>(() => NewsRepositoryImpl(getIt()));
  getIt.registerLazySingleton<NewsRestClient>(() => DioHelper().getDioNewsClient());
  Get.put(NewsController());
  Get.put(NavigationUtilities());

}