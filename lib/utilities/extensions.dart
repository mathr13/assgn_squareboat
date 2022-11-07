import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constants/constant_values.dart';
import '../constants/widgets/sbaction_button.dart';
import '../screens/news_home/error_scene.dart';
import 'enumerations.dart';

extension AdditionalWidgetUtilities on Widget {

  Widget wrapWidgetWithPadding(EdgeInsets padding) {
    return Padding(
      padding: padding,
      child: this,
    );
  }

  Widget wrapWidgetWithTapGesture({required Function() onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: this,
    );
  }

  ModalProgressHUD withProgressIndicator(bool showIndicator) {
    Widget progressIndicator = const SpinKitFadingFour(
      color: SBColours.primaryBckgLight,
    );
    return ModalProgressHUD(
      progressIndicator: progressIndicator,
      inAsyncCall: showIndicator,
      color: SBColours.primaryBckgDark,
      child: this
    );
  }

  Widget handleForNetworkError(NetworkState networkState, {Function()? completionHandler, String? errorTitle, String? errorDescription, String? buttonLabel}) {
    if(networkState == NetworkState.failed) {
      return const ErrorStateWidget(
        errorLabel: SBDisplayLabels.somethingwentwrong,
        assetAddress: SBAssets.nointernetconnection,
      );
    } else if(networkState == NetworkState.nolocation) {
      return ErrorStateWidget(
        errorLabel: SBDisplayLabels.errorfetchinglocation,
        errorDescription: "Please go to the settings and enable the location service for this app and then try again.",
        assetAddress: SBAssets.nointernetconnection,
        actionButton: SBActionButton(
          buttonLabel: SBDisplayLabels.tryagainbutton,
          onPressed: () => completionHandler!(),
        ),
      );
    } else if(networkState == NetworkState.noconnection) {
      return ErrorStateWidget(
        errorLabel: SBDisplayLabels.nointernetconnection,
        assetAddress: SBAssets.nointernetconnection,
        actionButton: SBActionButton(
          buttonLabel: SBDisplayLabels.tryagainbutton,
          onPressed: () => completionHandler!(),
        ),
      );
    } else if(networkState == NetworkState.succeeded) {
      return this;
    }
    return const SizedBox();
  }

  Widget handleForResults(bool isEmpty) {
    if(isEmpty) {
      return const ErrorStateWidget(
        errorLabel: SBDisplayLabels.noresultsfound,
        assetAddress: SBAssets.noresultsfound,
      );
    } else {
      return this;
    }
  }

}

extension ListUtilities on List<String> {

  String commaSeperated() {
    String result = "";
    for (String item in this) {
      result += "$item,";
    }
    result = result.replaceAll(" ", "-");
    if(result.endsWith(",")) result = result.substring(0, result.length-1);
    return result;
  }

}

extension IntegerUtilities on int {

  List<int> indexed() {
    List<int> result = [];
    for(int i=0;i<this;i++) {
      result.add(i+1);
    }
    return result;
  }

}