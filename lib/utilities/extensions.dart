import 'package:flutter/material.dart';

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

}