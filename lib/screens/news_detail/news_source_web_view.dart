import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../constants/constant_values.dart';

class NewsSourceWebView extends StatelessWidget {
  
  final String sourceUrl = Get.arguments?.sourceUrl;

  NewsSourceWebView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: SBColours.primaryBckgLight,
        elevation: 0,
      ),
      body: WebView(
        initialUrl: sourceUrl,
      ),
    );
  }
}