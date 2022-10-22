import 'package:get/get.dart';

import '../navigation/navigation_values.dart';

class NavigationUtilities {

  void waitAndNavigateToHome() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offNamed(Routes.newsHome);
  }

}