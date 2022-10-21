import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constant_values.dart';
import '../../controllers/news_controller.dart';

class SBSearchBar extends StatelessWidget {
  SBSearchBar({super.key});

  final NewsController _newsController = Get.find<NewsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(
        borderRadius: SBRadiuses.borderRadius2,
        color: SBColours.secondaryBckgDark,
      ),
      padding: SBPaddings.horizontalPadding2,
      child: const TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Search for news, topics..",
          suffixIcon: Icon(Icons.search, color: SBColours.primaryBckgDark,),
          contentPadding: SBPaddings.verticalPadding2
        ),
      ),
    );
  }
}