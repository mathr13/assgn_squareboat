import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'navigation/navigation_values.dart';

class SBANewsApp extends StatelessWidget {
  const SBANewsApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.initial,
      getPages: AppPages.pages,
    );
  }
}