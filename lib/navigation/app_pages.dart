import 'package:assgn_news_squareboat/screens/news_detail/news_detail.dart';
import 'package:get/get.dart';

import '../screens/news_home/news_home.dart';
import '../screens/splash_screen.dart';
import 'routes.dart';

class AppPages {

  static final pages = [
    GetPage(name: Routes.initial, page: () => const SplashScreen()),
    GetPage(name: Routes.newsHome, page: () => const NewsHomeApp()),
    GetPage(name: Routes.articleDetails, page: () => const NewsDetail()),
  ];

}