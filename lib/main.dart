import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'injector.dart';
import 'screens/news_home/news_home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await inject();
  runApp(const SBANewspp());
}

class SBANewspp extends StatelessWidget {
  const SBANewspp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewsHomeApp(),
      // home: NewsDetail(),
    );
  }
}