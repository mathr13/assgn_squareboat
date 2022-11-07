import 'package:assgn_news_squareboat/utilities/utility_values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constant_values.dart';
import '../../controllers/news/news_controller.dart';

class PaginationIndexing extends StatefulWidget {
  const PaginationIndexing({super.key});

  @override
  State<StatefulWidget> createState() => _PaginationIndexingState();
}

class _PaginationIndexingState extends State<PaginationIndexing> {

  final NewsController _newsController = Get.find<NewsController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _newsController.maxPageIndex.indexed().map(
        (index) => PageIndex(
          index: index,
          isSelected: index == _newsController.currentPageIndex,
        ).wrapWidgetWithTapGesture(
          onPressed: () => setState(() {
            if(_newsController.selectedFilters.isNotEmpty) {
              _newsController.fetchAllNewsArticlesWithConstraints(sources: _newsController.selectedFilters);
            }else {
              _newsController.fetchAllNewsArticlesWithConstraints(location: _newsController.selectedLocation);
            }
            _newsController.setCurrentPageIndexTo(index);
          })
        )
      ).toList()
    );
  }
}


class PageIndex extends StatelessWidget {

  final int index;
  final bool isSelected;

  const PageIndex({super.key, required this.index, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: SBPaddings.padding3,
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue[400] : Colors.blue[200],
        border: Border.all(color: isSelected ? SBColours.primaryTextDark : Colors.transparent)
      ),
      child: Text(
        index.toString(),
        style: SBTextStyles.pageIndex,
      ),
    );
  }
}