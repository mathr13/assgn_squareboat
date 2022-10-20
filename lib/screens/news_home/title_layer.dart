import 'package:flutter/material.dart';

import '../../constants/constant_values.dart';

class TitleLayer extends StatelessWidget {
  const TitleLayer({super.key});

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
          children: const [
            Text(
              "Sort: ",
              style: SBTextStyles.content4,
            ),
            Text(
              "Newest",
              style: SBTextStyles.content3,
            ),
            Icon(
              Icons.arrow_drop_down_sharp,
              color: SBColours.primaryBckgDark,
            ),
          ],
        ),
      ],
    );
  }
}