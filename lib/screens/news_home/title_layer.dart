import 'package:flutter/material.dart';

import '../../constants/constant_values.dart';

class TitleLayer extends StatelessWidget {

  final String sortingAttribute;

  const TitleLayer({super.key, required this.sortingAttribute});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Top Headlines",
          style: SBTextStyles.headline1,
        ),
        Row(
          children: [
            const Text(
              "Sort: ",
              style: SBTextStyles.content4,
            ),
            Text(
              sortingAttribute,
              style: SBTextStyles.content3,
            ),
            const Icon(
              Icons.arrow_drop_down_sharp,
              color: SBColours.primaryBckgDark,
            ),
          ],
        ),
      ],
    );
  }
}