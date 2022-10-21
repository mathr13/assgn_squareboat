import 'package:assgn_news_squareboat/controllers/news_controller.dart';
import 'package:assgn_news_squareboat/utilities/utility_values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constant_values.dart';
import '../../constants/widgets/sbmodal_sheet.dart';
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

class _NewsHomeAppState extends State<NewsHomeApp> {

  final NewsController _newsController = Get.find<NewsController>();

  @override
  void initState() {
    _newsController.fetchAllNewsArticlesWithConstraints();
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
                      sheetTitle: "Choose your location",
                      optionsTally: _newsController.locationsTally,
                      selectionType: SelectionType.oneToOne,
                    ),
                  );
                },
              ),
            ],
          ).wrapWidgetWithPadding(SBPaddings.bottomPadding3),
          centerTitle: false,
        ),
        body: Column(
          children:
          // [
          //   const Spacer(),
          //   ErrorStateWidget(
          //     errorLabel: "No internet connection!",
          //     assetAddress: "assets/images/internet_connection_error.png",
          //     actionButton: SBActionButton(
          //       buttonLabel: "Try again",
          //       onPressed: () {
          //         print("try again pressed");
          //       },
          //     ),
          //   ),
          //   const Spacer(),
          // ]
          [
            const SBSearchBar(),
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
                    sheetTitle: "Sort by",
                    optionsTally: _newsController.sortTally,
                    selectionType: SelectionType.oneToOne,
                    optionalCompetionHandler: () {
                      _newsController.sortTally.forEach((key, value) {
                        if(value) _newsController.selectedSortingAttribute.value = key;
                      });
                    },
                  ),
                );
              },
            ),
            Expanded(
              child: ListView(
                children: _newsController.newsArticlesList.map((e) => const ArticleCard()).toList(),
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
                sheetTitle: "Filter by sources",
                optionsTally: _newsController.sourcesTally,
                selectionType: SelectionType.oneToMany,
              ),
            );
          },
          backgroundColor: SBColours.primaryBckgLight,
          child: const Icon(
            Icons.filter_alt_outlined,
            size: 32,
            color: Colors.white,
          ),
        ),
      ).withProgressIndicator(_newsController.showProgressIndicator.value),
    );
  }
}