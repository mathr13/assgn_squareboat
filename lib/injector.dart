import 'package:assgn_news_squareboat/controllers/news_controller.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

var getIt = GetIt.I;

inject() {

  // getIt.registerLazySingleton<ItemRepository>(() => ItemRepositoryImpl(getIt()));
  // getIt.registerLazySingleton<ItemRestClient>(() => APIHelper().getDioItemClient());
  Get.put(NewsController());

}