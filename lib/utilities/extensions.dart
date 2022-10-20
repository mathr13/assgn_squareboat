import 'package:flutter/material.dart';

extension PaddedWidget on Widget {

  Widget wrapWidgetWithPadding(EdgeInsets padding) {
    return Padding(
      padding: padding,
      child: this,
    );
  }

}