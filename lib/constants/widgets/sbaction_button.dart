import 'package:assgn_news_squareboat/utilities/utility_values.dart';
import 'package:flutter/material.dart';

import '../constant_values.dart';

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