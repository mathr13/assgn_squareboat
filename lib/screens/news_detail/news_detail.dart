import 'package:assgn_news_squareboat/utilities/utility_values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constant_values.dart';
import '../../models/article.dart';
import 'article_header_image.dart';
import 'article_title.dart';
import 'external_link_option.dart';

class NewsDetail extends StatelessWidget {
  
  final Article article = Get.arguments?.article;

  NewsDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: SBColours.primaryBckgLight,
        leading: const Icon(
          Icons.arrow_back_ios_new_outlined,
        ).wrapWidgetWithTapGesture(
          onPressed: () => Get.back(),
        ),
        elevation: 0,
      ),
      backgroundColor: SBColours.secondaryBckgLight,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          ArticleHeaderImage(
            title: article.title ?? "",
            imageUrl: article.urlToImage ?? "",
          ),
          ArticleTitle(
            title: article.source?.name ?? "unknown source",
            timeInfo: ViewUtilities.getPrettifiedTimeLabelFor(article.publishedAt),
          ).wrapWidgetWithPadding(SBPaddings.padding1),
          Text(
            article.content ?? "",
            style: const TextStyle(
              fontSize: 18,
              color: SBColours.primaryBckgDark,
              fontWeight: FontWeight.w400
            ),
          ).wrapWidgetWithPadding(SBPaddings.horizontalPadding1),
          const ExternalLinkOption(),
        ],
      ),
    );
  }
}