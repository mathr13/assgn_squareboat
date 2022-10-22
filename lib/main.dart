import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'injector.dart';
import 'navigation/navigation_values.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await inject();
  runApp(const SBANewsApp());
}

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