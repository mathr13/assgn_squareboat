import 'package:assgn_news_squareboat/utilities/utility_values.dart';
import 'package:flutter/material.dart';

import '../../constants/constant_values.dart';
import 'article_header_image.dart';
import 'article_title.dart';
import 'external_link_option.dart';

class NewsDetail extends StatelessWidget {
  const NewsDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: SBColours.primaryBckgLight,
        leading: const Icon(
          Icons.arrow_back_ios_new_outlined,
        ),
        elevation: 0,
      ),
      body: ListView(
        children: [
          const ArticleHeaderImage(),
          const ArticleTitle().wrapWidgetWithPadding(SBPaddings.padding1),
          const Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            style: TextStyle(
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