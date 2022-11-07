import 'package:assgn_news_squareboat/utilities/utility_values.dart';
import 'package:flutter/material.dart';

import '../constant_values.dart';

class SBCheckboxOption extends StatelessWidget {

  final String optionTitle;
  final bool isSelected;

  const SBCheckboxOption({super.key, required this.optionTitle, required this.isSelected});

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
            isSelected ? Icons.check_box_outlined : Icons.check_box_outline_blank,
            color: isSelected ? SBColours.primaryBckgLight : const Color(0xff5A6580),
          ),
        ],
      ).wrapWidgetWithPadding(SBPaddings.verticalPadding3).wrapWidgetWithPadding(SBPaddings.horizontalPadding1),
    );
  }
}