import 'package:get_time_ago/get_time_ago.dart';

import '../constants/custom_timestamp_messages.dart';
import 'utility_values.dart';

abstract class ViewUtilities {

  static const Map<int, String> monthsTally = {1: "Jan", 2: "Feb", 3: "Mar", 4: "Apr", 5: "May", 6: "Jun", 7: "Jul", 8: "Aug", 9: "Sep", 10: "Oct", 11: "Nov", 12: "Dec"};
  static const Map<String, String> countryTally = {"co": "Colombia", "au": "Australia", "in": "India", "ca": "Canada", "us": "USA"};

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

  static String getCountryLabelForIsoCode(String countryCode) => countryTally[countryCode] ?? "countryCode";

  bool getProgressIndicatorStatusFor(NetworkState networkState) => networkState == NetworkState.inprogress ? true : false;

}