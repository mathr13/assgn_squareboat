import 'package:assgn_news_squareboat/utilities/utility_values.dart';
import 'package:flutter/material.dart';

import '../../constants/constant_values.dart';
import 'article_card.dart';
import 'search_bar.dart';
import 'title_layer.dart';

class NotesHomeApp extends StatefulWidget {
  const NotesHomeApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NotesHomeAppState();
  }
}

class _NotesHomeAppState extends State<NotesHomeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SBColours.secondaryBckgLight,
      appBar: AppBar(
        backgroundColor: SBColours.primaryBckgLight,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              "MyNEWS",
              style: SBTextStyles.titleLight1,
              ),
            Column(
              children: [
                const Text(
                  "LOCATION",
                  style: SBTextStyles.titleLight2,
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.location_on,
                      size: SBSizes.primaryIconSize,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "India",
                      style: SBTextStyles.titleLight3,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ).wrapWidgetWithPadding(SBPaddings.bottomPadding3),
        centerTitle: false,
      ),
      body: Column(
        children: [
          const SBSearchBar(),
          const TitleLayer().wrapWidgetWithPadding(SBPaddings.verticalPadding1),
          Expanded(
            child: ListView(
              children: [1,2,3,4,5].map((e) => const ArticleCard()).toList(),
            )
          ),
        ],
      ).wrapWidgetWithPadding(SBPaddings.padding1),
    );
  }
}