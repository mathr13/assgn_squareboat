import 'package:assgn_news_squareboat/models/option.dart';
import 'package:assgn_news_squareboat/utilities/utility_values.dart';
import 'package:flutter/material.dart';

import '../../constants/constant_values.dart';
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
        //   Spacer(),
        //   const NoResultFound(),
        //   Spacer(),
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

class SBModalSheet extends StatelessWidget {

  final String sheetTitle;
  final SelectionType selectionType;
  final List<Option> options;

  const SBModalSheet({super.key, required this.sheetTitle, required this.selectionType, required this.options});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Container(
            height: 8,
            width: 60,
            decoration: const BoxDecoration(
              color: Color(0xffD6D9DF),
              borderRadius: SBRadiuses.borderRadius1
            ),
          ).wrapWidgetWithPadding(SBPaddings.verticalPadding3),
          Row(
            children: [
              Text(
                sheetTitle,
                style: const TextStyle(
                  fontSize: 20,
                  color: Color(0xff5A6580),
                  fontWeight: FontWeight.w700
                ),
              ),
            ],
          ).wrapWidgetWithPadding(SBPaddings.horizontalPadding1).wrapWidgetWithPadding(SBPaddings.verticalPadding3),
          const Divider(
            color: Color(0xff5A6580),
          ).wrapWidgetWithPadding(SBPaddings.horizontalPadding1).wrapWidgetWithPadding(SBPaddings.bottomPadding3),
          Expanded(
            child: ListView(
              children: options.map(
                (option) => selectionType == SelectionType.oneToMany 
                  ? SBCheckboxOption(optionTitle: option.title, isSelected: option.isSelected)
                  : SBRadioOption(optionTitle: option.title, isSelected: option.isSelected)
              ).toList(),
            ),
          ),
          SBActionButton(
            buttonLabel: "Apply",
            onPressed: () {
              print("apply cab pressed");
            },
          ),
        ]
      ),
    );
  }
}

class SBCheckboxOption extends StatelessWidget {

  final String optionTitle;
  final bool isSelected;

  const SBCheckboxOption({super.key, required this.optionTitle, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          optionTitle,
          style: TextStyle(
            fontSize: 16,
            color: isSelected ? SBColours.primaryBckgLight : const Color(0xff5A6580),
          ),
        ),
        Icon(
          isSelected ? Icons.check_box_outlined : Icons.check_box_outline_blank,
          color: isSelected ? SBColours.primaryBckgLight : const Color(0xff5A6580),
        ),
      ],
    ).wrapWidgetWithPadding(SBPaddings.verticalPadding3).wrapWidgetWithPadding(SBPaddings.horizontalPadding1);
  }
}

class SBRadioOption extends StatelessWidget {

  final String optionTitle;
  final bool isSelected;

  const SBRadioOption({super.key, required this.optionTitle, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          optionTitle,
          style: TextStyle(
            fontSize: 16,
            color: isSelected ? SBColours.primaryBckgLight : const Color(0xff5A6580),
          ),
        ),
        Icon(
          isSelected ? Icons.radio_button_checked_sharp : Icons.radio_button_off,
          color: isSelected ? SBColours.primaryBckgLight : const Color(0xff5A6580),
        ),
      ],
    ).wrapWidgetWithPadding(SBPaddings.verticalPadding3).wrapWidgetWithPadding(SBPaddings.horizontalPadding1);
  }
}

class SBActionButton extends StatelessWidget {

  final String buttonLabel;
  final Function() onPressed;

  const SBActionButton({super.key, required this.buttonLabel, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: SBColours.primaryBckgLight,
        borderRadius: SBRadiuses.borderRadius3
      ),
      padding: SBPaddings.btnpadding,
      child: Text(
        buttonLabel,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.w600
        ),
      ),
    ).wrapWidgetWithTapGesture(onPressed: onPressed);
  }
}