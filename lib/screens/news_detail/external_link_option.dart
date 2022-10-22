import 'package:assgn_news_squareboat/constants/constant_values.dart';
import 'package:flutter/material.dart';

class ExternalLinkOption extends StatelessWidget {
  const ExternalLinkOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: SBPaddings.padding1,
      child: Row(
        children: const [
          Text(
            SBDisplayLabels.seefullstory,
            style: TextStyle(
              color: SBColours.primaryBckgLight,
              fontSize: 16,
              fontWeight: FontWeight.w600
            ),
          ),
          Icon(
            Icons.navigate_next_rounded,
            color: SBColours.primaryBckgLight
          ),
        ],
      ),
    );
  }
}