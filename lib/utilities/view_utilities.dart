import 'package:get_time_ago/get_time_ago.dart';

import '../constants/custom_timestamp_messages.dart';
import 'utility_values.dart';

mixin ViewUtilities {

  static const Map<int, String> monthsTally = {1: "Jan", 2: "Feb", 3: "Mar", 4: "Apr", 5: "May", 6: "Jun", 7: "Jul", 8: "Aug", 9: "Sep", 10: "Oct", 11: "Nov", 12: "Dec"};
  static const Map<String, String> _countryTally = {"CO": "Colombia", "AU": "Australia", "IN": "India", "CA": "Canada", "US": "USA", "CN": "China"};
  static const Map<String, String> _sortOptionsTally = {"relevancy": "Relevancy", "popularity": "Popularity", "publishedAt": "Published At"};
  
  static const Map<String, String> displayMemeberLabels = {..._countryTally,..._sortOptionsTally};

  static void setCustomMessagesForTimestampLabels() {
    GetTimeAgo.setCustomLocaleMessages('en', CustomTimestampMessages());
  }

  static String getTimeLabelFor(String? time) {
    if(time != null) {
      DateTime dateTime = DateTime.parse(time);
      return GetTimeAgo.parse(dateTime, locale: "en");
    }
    return "time unknown";
  }

  static String getPrettifiedTimeLabelFor(String? time) {
    if(time != null) {
      DateTime dateTime = DateTime.parse(time);
      return "${dateTime.day} ${getMonthLabelFor(dateTime.month)}, ${dateTime.year} at ${dateTime.hour}:${dateTime.minute}";
    }
    return "time unknown";
  }

  static String getMonthLabelFor(int monthIndex) => monthsTally[monthIndex]!;
  String getDisplayLabelFor(String key) => displayMemeberLabels[key] ?? key;

  bool getProgressIndicatorStatusFor(NetworkState networkState) => networkState == NetworkState.inprogress ? true : false;

}