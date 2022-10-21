import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constants/constant_values.dart';

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

}