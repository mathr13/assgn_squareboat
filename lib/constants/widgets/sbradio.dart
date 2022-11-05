import 'package:assgn_news_squareboat/utilities/utility_values.dart';
import 'package:flutter/material.dart';

import '../constant_values.dart';

class SBRadioOption extends StatelessWidget {

  final String optionTitle;
  final bool isSelected;

  const SBRadioOption({super.key, required this.optionTitle, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Row(
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
      ).wrapWidgetWithPadding(SBPaddings.verticalPadding3).wrapWidgetWithPadding(SBPaddings.horizontalPadding1),
    );
  }
}