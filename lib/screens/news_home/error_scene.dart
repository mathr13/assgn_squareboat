

import 'package:flutter/material.dart';

import '../../constants/constant_values.dart';
import '../../utilities/utility_values.dart';

class ErrorStateWidget extends StatelessWidget {

  final String errorLabel;
  final String? errorDescription;
  final String assetAddress;
  final Widget actionButton;

  const ErrorStateWidget({super.key, required this.errorLabel, this.errorDescription, required this.assetAddress, this.actionButton = const SizedBox()});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 2,),
          Image.asset(assetAddress).wrapWidgetWithPadding(SBPaddings.bottomPadding1),
          Text(
            errorLabel,
            style: SBTextStyles.content1,
          ),
          const SizedBox(
            height: 20,
          ),
          errorDescription != null
            ? Text(
                errorDescription!,
                textAlign: TextAlign.center,
                style: SBTextStyles.content2,
              ).wrapWidgetWithPadding(SBPaddings.bottomPadding1)
            : const SizedBox(),
          actionButton.wrapWidgetWithPadding(SBPaddings.topPadding1),
          const Spacer(flex: 2,),
        ],
      ),
    );
  }
}