import 'package:get_time_ago/get_time_ago.dart';

import '../constants/custom_timestamp_messages.dart';

abstract class ViewUtilities {

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

  static String getMonthLabelFor(int monthIndex) {
    Map<int, String> monthsTally = {1: "Jan", 2: "Feb", 3: "Mar", 4: "Apr", 5: "May", 6: "Jun", 7: "Jul", 8: "Aug", 9: "Sep", 10: "Oct", 11: "Nov", 12: "Dec"};
    return monthsTally[monthIndex]!;
  }

}