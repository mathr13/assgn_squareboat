import 'package:assgn_news_squareboat/models/option.dart';
import 'package:assgn_news_squareboat/utilities/utility_values.dart';
import 'package:flutter/material.dart';

import '../../constants/constant_values.dart';
import '../../constants/widgets/sbmodal_sheet.dart';
import 'article_card.dart';
import 'search_bar.dart';
import 'title_layer.dart';

class NotesHomeApp extends StatefulWidget {
  const NotesHomeApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NotesHomeAppState();
  }
}

class _NotesHomeAppState extends State<NotesHomeApp> {

  List<Option> options = [
    Option(title: "Source 1", isSelected: false),
    Option(title: "Source 2", isSelected: false),
    Option(title: "Source 3", isSelected: true),
    Option(title: "Source 4", isSelected: false),
    Option(title: "Source 5", isSelected: true),
    Option(title: "Source 6", isSelected: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  children: const [
                    Icon(
                      Icons.location_on,
                      size: SBSizes.primaryIconSize,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "India",
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
                    sheetTitle: "Filter by sources",
                    options: options,
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
          const TitleLayer().wrapWidgetWithPadding(SBPaddings.verticalPadding1),
          Expanded(
            child: ListView(
              children: [1,2,3,4,5].map((e) => const ArticleCard()).toList(),
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
              sheetTitle: "Choose your location",
              options: options,
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
    );
  }
}