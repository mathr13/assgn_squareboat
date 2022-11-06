import 'package:flutter/material.dart';

import '../../constants/constant_values.dart';

class FilterButton extends StatelessWidget {

  final bool isActive;
  final Function() onPressHandler;

  const FilterButton({super.key, required this.isActive, required this.onPressHandler});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => onPressHandler(),
      backgroundColor: SBColours.primaryBckgLight,
      child: Stack(
        children: [
          const Icon(
            Icons.filter_alt_outlined,
            size: 32,
            color: Colors.white,
          ),
          Positioned(
            right: 0,
            child: CircleAvatar(
              radius: isActive ? 4 : 0,
              backgroundColor: SBColours.notificationLight,
            ),
          ),
        ],
      ),
    );
  }
}