import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constant_values.dart';
import '../../controllers/news_controller.dart';

class SBSearchBar extends StatelessWidget {
  
  final bool enabled;
  final TextEditingController? controller;
  final Function(String query)? submissionHandler;

  const SBSearchBar({super.key, required this.enabled, this.controller, this.submissionHandler});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(
        borderRadius: SBRadiuses.borderRadius2,
        color: SBColours.secondaryBckgDark,
      ),
      padding: SBPaddings.horizontalPadding2,
      child: TextField(
        enabled: enabled,
        controller: controller,
        autofocus: enabled,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: SBDisplayLabels.searchbarhinttext,
          suffixIcon: Icon(Icons.search, color: SBColours.primaryBckgDark,),
          contentPadding: SBPaddings.verticalPadding2
        ),
        onSubmitted: (value) {
          submissionHandler!(value);
        },
      ),
    );
  }
}