
import 'package:flutter/material.dart';
import '../../controllers/modal_sheet_controller.dart';
import '../../utilities/utility_values.dart';
import '../constant_values.dart';
import 'sbaction_button.dart';
import 'sbcheckbox.dart';
import 'sbradio.dart';

class SBModalSheet extends StatefulWidget {

  final String sheetTitle;
  final SelectionType selectionType;
  final Map<String, bool> optionsTally;
  final Function(List<String>)? optionalCompetionHandler;

  const SBModalSheet({super.key, required this.sheetTitle, required this.selectionType, required this.optionsTally, this.optionalCompetionHandler});

  @override
  State<StatefulWidget> createState() => _SBModalSheetState();
}

class _SBModalSheetState extends State<SBModalSheet> {

  final SBModalSheetController _sheetController = SBModalSheetController();

  @override
  void initState() {
    _sheetController.populateOptions(widget.optionsTally);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Container(
            height: 8,
            width: 60,
            decoration: const BoxDecoration(
              color: Color(0xffD6D9DF),
              borderRadius: SBRadiuses.borderRadius1
            ),
          ).wrapWidgetWithPadding(SBPaddings.verticalPadding3),
          Row(
            children: [
              Text(
                widget.sheetTitle,
                style: const TextStyle(
                  fontSize: 20,
                  color: Color(0xff5A6580),
                  fontWeight: FontWeight.w700
                ),
              ),
            ],
          ).wrapWidgetWithPadding(SBPaddings.horizontalPadding1).wrapWidgetWithPadding(SBPaddings.verticalPadding3),
          const Divider(
            color: Color(0xff5A6580),
          ).wrapWidgetWithPadding(SBPaddings.horizontalPadding1).wrapWidgetWithPadding(SBPaddings.bottomPadding3),
          StatefulBuilder(
            builder: (context, updateModalSheetState) {
              return Expanded(
                child: ListView.builder(
                  itemCount: _sheetController.getOptions.length,
                  itemBuilder: (context, index) {
                    return widget.selectionType == SelectionType.oneToMany
                    ? SBCheckboxOption(
                        optionTitle: _sheetController.getOptions[index],
                        isSelected: _sheetController.getOptionsStatus[index]
                      ).wrapWidgetWithTapGesture(
                      onPressed: () => updateModalSheetState(() => _sheetController.triggerSelectionWith(index, widget.selectionType)),
                    )
                    : SBRadioOption(
                        optionTitle: _sheetController.getOptions[index],
                        isSelected: _sheetController.getOptionsStatus[index]
                    ).wrapWidgetWithTapGesture(
                      onPressed: () => updateModalSheetState(() => _sheetController.triggerSelectionWith(index, widget.selectionType)),
                    );
                  },
                ),
              );
            }
          ),
          SBActionButton(
            buttonLabel: "Apply",
            onPressed: () => _sheetController.applyFilter(widget.optionsTally, optionalCompetionHandler: widget.optionalCompetionHandler),
          ).wrapWidgetWithPadding(SBPaddings.topPadding2),
        ]
      ),
    );
  }

}