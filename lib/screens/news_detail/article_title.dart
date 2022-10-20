import 'package:assgn_news_squareboat/constants/constant_values.dart';
import 'package:assgn_news_squareboat/utilities/utility_values.dart';
import 'package:flutter/material.dart';

class ArticleTitle extends StatelessWidget {
  const ArticleTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "NewsSource",
          style: SBTextStyles.content1,
        ).wrapWidgetWithPadding(SBPaddings.bottomPadding4),
        const Text(
          "22 Sep, 2020 at 4:55 PM",
          style: SBTextStyles.content4,
        ),
      ],
    );
  }
}