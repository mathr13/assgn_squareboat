import 'package:assgn_news_squareboat/utilities/utility_values.dart';
import 'package:flutter/material.dart';

import '../../constants/constant_values.dart';

class TitleLayer extends StatelessWidget with ViewUtilities {

  final String sortingAttribute;

  const TitleLayer({super.key, required this.sortingAttribute});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          SBDisplayLabels.topheadlines,
          style: SBTextStyles.headline1,
        ),
        Row(
          children: [
            const Text(
              SBDisplayLabels.sort,
              style: SBTextStyles.content4,
            ),
            Text(
              getDisplayLabelFor(sortingAttribute),
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