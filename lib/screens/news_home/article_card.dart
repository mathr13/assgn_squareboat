import 'package:assgn_news_squareboat/utilities/utility_values.dart';
import 'package:flutter/material.dart';

import '../../constants/constant_values.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({super.key});

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
              children: const [
                Text(
                  "NewsSource",
                  style: SBTextStyles.content1,
                ),
                Spacer(),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce sit amet sapien ac turpis vulputate egestas sit amet in diam. Vivamus orci ex, convallis non velit id, tristique aliquam nisi. Sed sed nisi faucibus tellus facilisis euismod non quis lacus. Donec congue dignissim dui ac imperdiet. Ut eu enim ligula. Duis et neque nisi. Etiam dignissim nulla id neque laoreet rhoncus.",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: SBTextStyles.content2,
                ),
                Spacer(
                  flex: 2,
                ),
                Text(
                  "10 min ago",
                  style: SBTextStyles.content4,
                ),
              ],
            ),
          ),
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              height: double.maxFinite,
              decoration: const BoxDecoration(
                color: SBColours.primaryBckgDark,
                borderRadius: SBRadiuses.borderRadius3
              ),
            ),
          ).wrapWidgetWithPadding(SBPaddings.leftPadding2),
        ],
      ).wrapWidgetWithPadding(SBPaddings.padding2),
    ).wrapWidgetWithPadding(SBPaddings.verticalPadding3);
  }
}