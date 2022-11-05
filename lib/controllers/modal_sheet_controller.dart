import 'package:get/get.dart';

import '../utilities/utility_values.dart';

class SBModalSheetController {

  List<String> _options = [];
  List<String> get getOptions => _options;

  List<bool> _statuses = [];
  List<bool> get getOptionsStatus => _statuses;

  populateOptions(Map<String, bool> optionsTally) {
    _options = optionsTally.keys.toList();
    _statuses = optionsTally.values.toList();
  }

  triggerSelectionWith(int index, SelectionType selectionType) {
    if(selectionType == SelectionType.oneToOne && _statuses[index]) return;
    _statuses[index] = !_statuses[index];
    if(selectionType == SelectionType.oneToOne) {
      for(int i=0;i<_statuses.length;i++) {
        if (i != index) _statuses[i] = false;
      }
    }
  }

  applyFilter(Map<String, bool> optionsTally, {Function(List<String>)? optionalCompetionHandler}) {
    List<String> selectedOptions = [];
    for(int i=0;i<getOptions.length;i++) {
      String option = getOptions[i];
      optionsTally[option] = getOptionsStatus[i];
      if(getOptionsStatus[i]) selectedOptions.add(option);
    }
    if (optionalCompetionHandler != null) {
      optionalCompetionHandler(selectedOptions);
    }
    Get.back();
  }

}