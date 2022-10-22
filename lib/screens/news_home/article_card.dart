import 'package:assgn_news_squareboat/utilities/utility_values.dart';
import 'package:flutter/material.dart';

import '../../constants/constant_values.dart';
import '../../models/article.dart';

class ArticleCard extends StatelessWidget {
  
  final Article article;

  const ArticleCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5.0,
            spreadRadius: 0.05,
          ),
        ],
        borderRadius: SBRadiuses.borderRadius3
      ),
      margin: SBPaddings.horizontalPadding5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.source?.name ?? "unknown source",
                  style: const TextStyle(
                    fontSize: 18,
                    color: SBColours.primaryBckgDark,
                    fontWeight: FontWeight.w600
                  ),
                ),
                const Spacer(),
                Text(
                  article.title ?? "untitled",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    color: SBColours.primaryBckgDark,
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                Text(
                  ViewUtilities.getTimeLabelFor(article.publishedAt),
                  // article.publishedAt ?? "10 min ago",
                  maxLines: 1,
                  style: SBTextStyles.content4,
                ),
              ],
            ),
          ),
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              height: double.maxFinite,
              decoration: BoxDecoration(
                color: SBColours.primaryBckgDark,
                borderRadius: SBRadiuses.borderRadius3,
                image: DecorationImage(image: NetworkImage(article.urlToImage ?? ""), fit: BoxFit.cover),
              ),
            ),
          ).wrapWidgetWithPadding(SBPaddings.leftPadding2),
        ],
      ).wrapWidgetWithPadding(SBPaddings.padding2),
    ).wrapWidgetWithPadding(SBPaddings.verticalPadding3);
  }
}