

import 'package:flutter/material.dart';

import '../../models/option.dart';
import '../../utilities/utility_values.dart';
import '../constant_values.dart';
import 'sbaction_button.dart';
import 'sbcheckbox.dart';
import 'sbradio.dart';

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
          ).wrapWidgetWithPadding(SBPaddings.topPadding2),
        ]
      ),
    );
  }
}