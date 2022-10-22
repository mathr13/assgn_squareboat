import 'package:assgn_news_squareboat/controllers/news_controller.dart';
import 'package:assgn_news_squareboat/utilities/utility_values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constant_values.dart';
import '../../constants/widgets/sbaction_button.dart';
import '../../constants/widgets/sbmodal_sheet.dart';
import '../../navigation/navigation_values.dart';
import '../../services/navigation_helper.dart';
import 'article_card.dart';
import 'no_result_found.dart';
import 'search_bar.dart';
import 'title_layer.dart';

class NewsHomeApp extends StatefulWidget {
  const NewsHomeApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewsHomeAppState();
  }
}

class _NewsHomeAppState extends State<NewsHomeApp> {

  final NewsController _newsController = Get.find<NewsController>();

  @override
  void initState() {
    ViewUtilities.setCustomMessagesForTimestampLabels();
    _newsController.populateLocationsList();
    _newsController.populateSortList();
    _newsController.fetchAllNewsArticlesWithConstraints(_newsController.selectedLocation.value);
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
                        _newsController.selectedLocation.value,
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
                          if(value) _newsController.selectedLocation.value = key;
                        });
                        _newsController.fetchAllNewsArticlesWithConstraints(selectedValues.first);
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
          children: _newsController.haveRequestedOnce && _newsController.newsArticlesList.isEmpty
          ? [
              const Spacer(),
              const ErrorStateWidget(
                errorLabel: SBDisplayLabels.noresultsfound,
                assetAddress: SBAssets.noresultsfound,
                // actionButton: SBActionButton(
                //   buttonLabel: SBDisplayLabels.tryagainbutton,
                //   onPressed: () {
                //     //
                //   },
                // ),
              ),
              const Spacer(),
            ]
          : [
            const SBSearchBar(enabled: false,).wrapWidgetWithTapGesture(
              onPressed: () => Get.toNamed(Routes.searchScreen),
            ),
            TitleLayer(
              sortingAttribute: _newsController.selectedSortingAttribute.value,
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
                        if(value) _newsController.selectedSortingAttribute.value = key;
                      });
                      _newsController.fetchAllNewsArticlesWithConstraints(_newsController.selectedLocation.value, sortBy: selectedValues.first);
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
          ],
        ).wrapWidgetWithPadding(SBPaddings.padding1),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: SBRadiuses.borderRadius3,
              ),
              builder: (context) => SBModalSheet(
                sheetTitle: SBDisplayLabels.filterbysources,
                optionsTally: _newsController.sourcesTally,
                selectionType: SelectionType.oneToMany,
                optionalCompetionHandler: (selectedValues) {
                  _newsController.isSourceSelectionActive = selectedValues.isEmpty ? false : true;
                  _newsController.fetchAllNewsArticlesWithConstraints(_newsController.selectedLocation.value, sources: selectedValues);
                },
              ),
            );
          },
          backgroundColor: SBColours.primaryBckgLight,
          child: Stack(
            children: [
              const Icon(
                Icons.filter_alt_outlined,
                size: 32,
                color: Colors.white,
              ),
              Positioned(
                right: 0,
                child: CircleAvatar(
                  radius: _newsController.isSourceSelectionActive ? 4 : 0,
                  backgroundColor: SBColours.notificationLight,
                ),
              ),
            ],
          ),
        ),
      ).withProgressIndicator(_newsController.showProgressIndicator.value),
    );
  }
}