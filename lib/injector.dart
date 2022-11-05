import 'package:assgn_news_squareboat/controllers/news/news_controller.dart';
import 'package:assgn_news_squareboat/repositories/news_repository.dart';
import 'package:assgn_news_squareboat/services/dio_helper.dart';
import 'package:assgn_news_squareboat/utilities/navigation_utility.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:location/location.dart';

import 'services/location_helper.dart';
import 'services/news_rest_client.dart';

var getIt = GetIt.I;

inject() {

  getIt.registerLazySingleton<NewsRepository>(() => NewsRepositoryImpl(getIt()));
  getIt.registerLazySingleton<NewsRestClient>(() => DioHelper().getDioNewsClient());
  getIt.registerLazySingleton<Location>(() => Location());
  getIt.registerLazySingleton<LocationHelper>(() => LocationHelper(getIt()));
  Get.put(NewsController());
  Get.put(NavigationUtilities());

}