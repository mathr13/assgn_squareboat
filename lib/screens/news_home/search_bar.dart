import 'package:flutter/material.dart';

import '../../constants/constant_values.dart';

class SBSearchBar extends StatelessWidget {
  const SBSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(
        borderRadius: SBRadiuses.borderRadius2,
        color: SBColours.secondaryBckgDark,
      ),
      padding: SBPaddings.horizontalPadding2,
      child: const TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Search for news, topics..",
          suffixIcon: Icon(Icons.search, color: SBColours.primaryBckgDark,),
          contentPadding: SBPaddings.verticalPadding2
        ),
      ),
    );
  }
}