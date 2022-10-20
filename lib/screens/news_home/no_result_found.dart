

import 'package:flutter/material.dart';

import '../../constants/constant_values.dart';
import '../../utilities/utility_values.dart';

class ErrorStateWidget extends StatelessWidget {

  final String errorLabel;
  final String assetAddress;
  final Widget actionButton;

  const ErrorStateWidget({super.key, required this.errorLabel, required this.assetAddress, this.actionButton = const SizedBox()});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(assetAddress).wrapWidgetWithPadding(SBPaddings.bottomPadding1),
          Text(
            errorLabel,
            style: SBTextStyles.content1,
          ),
          actionButton.wrapWidgetWithPadding(SBPaddings.topPadding1)
        ],
      ),
    );
  }
}