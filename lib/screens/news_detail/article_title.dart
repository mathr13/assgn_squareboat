import 'package:assgn_news_squareboat/constants/constant_values.dart';
import 'package:assgn_news_squareboat/utilities/utility_values.dart';
import 'package:flutter/material.dart';

class ArticleTitle extends StatelessWidget {

  final String title;
  final String timeInfo;

  const ArticleTitle({super.key, required this.title, required this.timeInfo});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: SBTextStyles.content1,
        ).wrapWidgetWithPadding(SBPaddings.bottomPadding4),
        Text(
          timeInfo,
          style: SBTextStyles.content4,
        ),
      ],
    );
  }
}