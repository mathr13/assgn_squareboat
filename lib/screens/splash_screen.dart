import 'package:assgn_news_squareboat/utilities/navigation_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constant_values.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {

  final NavigationUtilities _navigationUtilities = Get.find<NavigationUtilities>();

  @override
  void initState() {
    _navigationUtilities.waitAndNavigateToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: SBColours.primaryBckgLight,
      body: Center(
        child: Text(
          SBValueLabels.appTitle,
          style: SBTextStyles.appTitle,
        ),
      ),
    );
  }
}