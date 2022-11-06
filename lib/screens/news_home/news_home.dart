import 'package:assgn_news_squareboat/controllers/news/news_controller.dart';
import 'package:assgn_news_squareboat/screens/news_home/filter_button.dart';
import 'package:assgn_news_squareboat/utilities/utility_values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constant_values.dart';
import '../../constants/widgets/sbmodal_sheet.dart';
import '../../navigation/navigation_values.dart';
import '../../services/navigation_helper.dart';
import 'article_card.dart';
import 'search_bar.dart';
import 'title_layer.dart';

class NewsHomeApp extends StatefulWidget {
  const NewsHomeApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewsHomeAppState();
  }
}

class _NewsHomeAppState extends State<NewsHomeApp> with ViewUtilities {

  final NewsController _newsController = Get.find<NewsController>();
  
  @override
  void initState() {
    _newsController.loadApiKey();
    ViewUtilities.setCustomMessagesForTimestampLabels();
    _newsController.populateNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: SBColours.secondaryBckgLight,
        appBar: AppBar(
          backgroundColor: SBColours.primaryBckgLight,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                SBValueLabels.appTitle,
                style: SBTextStyles.titleLight1,
                ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    SBDisplayLabels.locationLabel,
                    style: SBTextStyles.titleLight2,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: SBSizes.primaryIconSize,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        getDisplayLabelFor(_newsController.selectedLocation),
                        style: SBTextStyles.titleLight3,
                      ),
                    ],
                  ),
                ],
              ).wrapWidgetWithTapGesture(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: SBRadiuses.borderRadius3,
                    ),
                    builder: (context) => SBModalSheet(
                      sheetTitle: SBDisplayLabels.chooseyourlocation,
                      optionsTally: _newsController.locationsTally,
                      selectionType: SelectionType.oneToOne,
                      optionalCompetionHandler: (selectedValues) {
                        _newsController.locationsTally.forEach((key, value) {
                          if(value) _newsController.selectedLocation = key;
                        });
                        _newsController.fetchAllNewsArticlesWithConstraints(location: selectedValues.first);
                      },
                    ),
                  );
                },
              ),
            ],
          ).wrapWidgetWithPadding(SBPaddings.bottomPadding3),
          centerTitle: false,
        ),
        body: Column(
          children: [
            const SBSearchBar(enabled: false,).wrapWidgetWithTapGesture(
              onPressed: () => Get.toNamed(Routes.searchScreen),
            ),
            TitleLayer(
              sortingAttribute: _newsController.selectedSortingAttribute,
            ).wrapWidgetWithPadding(SBPaddings.verticalPadding1).wrapWidgetWithTapGesture(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: SBRadiuses.borderRadius3,
                  ),
                  builder: (context) => SBModalSheet(
                    sheetTitle: SBDisplayLabels.sortby,
                    optionsTally: _newsController.sortTally,
                    selectionType: SelectionType.oneToOne,
                    optionalCompetionHandler: (selectedValues) {
                      _newsController.sortTally.forEach((key, value) {
                        if(value) _newsController.selectedSortingAttribute = key;
                      });
                      _newsController.fetchAllNewsArticlesWithConstraints(location: _newsController.selectedLocation, sortBy: selectedValues.first);
                    },
                  ),
                );
              },
            ),
            Expanded(
              child: ListView(
                children: _newsController.newsArticlesList.map(
                  (article) => ArticleCard(article: article,).wrapWidgetWithTapGesture(
                    onPressed: () => Get.toNamed(Routes.articleDetails, arguments: GetArguements(article: article)),
                  )
                ).toList(),
              )
            ),
          ]
        )
        .handleForResults(_newsController.newsArticlesList.isEmpty)
        .handleForNetworkError(
          _newsController.networkState.value,
          completionHandler: () => _newsController.fetchAllNewsArticlesWithConstraints(location: _newsController.selectedLocation),
        )
        .wrapWidgetWithPadding(SBPaddings.padding1),
        floatingActionButton: FilterButton(
          onPressHandler: () => showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: SBRadiuses.borderRadius3,
            ),
            builder: (context) => SBModalSheet(
              sheetTitle: SBDisplayLabels.filterbysources,
              optionsTally: _newsController.sourcesTally,
              selectionType: SelectionType.oneToMany,
              optionalCompetionHandler: (selectedValues) {
                _newsController.setSourceSelectionTo(selectedValues.isNotEmpty);
                if(selectedValues.isNotEmpty) {
                _newsController.fetchAllNewsArticlesWithConstraints(sources: selectedValues);
                }else {
                  _newsController.fetchAllNewsArticlesWithConstraints(location: _newsController.selectedLocation);
                }
              },
            ),
          ),
          isActive: _newsController.isSourceSelectionActive,
        ),
      ).withProgressIndicator(getProgressIndicatorStatusFor(_newsController.networkState.value)),
    );
  }
}