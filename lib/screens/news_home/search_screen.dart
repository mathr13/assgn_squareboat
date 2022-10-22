import 'package:assgn_news_squareboat/utilities/utility_values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constant_values.dart';
import '../../controllers/news_controller.dart';
import '../../navigation/navigation_values.dart';
import '../../services/navigation_helper.dart';
import 'article_card.dart';
import 'search_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SearchScreenState();
  }
}

class _SearchScreenState extends State<SearchScreen> {

  final NewsController _newsController = Get.find<NewsController>();

  @override
  void initState() {
    _newsController.initialiseSearch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SBColours.secondaryBckgLight,
      appBar: AppBar(
        backgroundColor: SBColours.primaryBckgLight,
        leading: const Icon(
          Icons.arrow_back_ios_new_outlined,
        ).wrapWidgetWithTapGesture(
          onPressed: () => Get.back(),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          SBSearchBar(
            enabled: true,
            submissionHandler: (query) {
              _newsController.searchForQuery(query);
            },
          ).wrapWidgetWithPadding(SBPaddings.bottomPadding2),
          Expanded(
            child: Obx(
              () => ListView(
                children: _newsController.filteredNewsArticlesList.map(
                  (article) => ArticleCard(article: article,).wrapWidgetWithTapGesture(
                    onPressed: () => Get.toNamed(Routes.articleDetails, arguments: GetArguements(article: article)),
                  )
                ).toList(),
              ).withProgressIndicator(_newsController.showProgressIndicator.value),
            )
          ),
        ],
      ).wrapWidgetWithPadding(SBPaddings.padding1),
    ).wrapWidgetWithTapGesture(
      onPressed: () => FocusScope.of(context).unfocus(),
    );
  }
}