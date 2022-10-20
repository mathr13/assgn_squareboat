

import 'package:flutter/material.dart';

import '../../constants/constant_values.dart';
import '../../utilities/utility_values.dart';

class NoResultFound extends StatelessWidget {
  const NoResultFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset("assets/images/no_result_found.png").wrapWidgetWithPadding(SBPaddings.bottomPadding1),
          const Text(
            "No result found!",
            style: SBTextStyles.content1,
          )
        ],
      ),
    );
  }
}