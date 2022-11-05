import 'package:get_time_ago/get_time_ago.dart';

class CustomTimestampMessages implements Messages {
  @override
  String prefixAgo() => '';

  @override
  String suffixAgo() => 'ago';

  @override
  String secsAgo(int seconds) => '$seconds sec';

  @override
  String minAgo(int minutes) => '1 min';

  @override
  String minsAgo(int minutes) => '$minutes min';

  @override
  String hourAgo(int minutes) => '1 hr';

  @override
  String hoursAgo(int hours) => '$hours hr';

  @override
  String dayAgo(int hours) => '1 day';

  @override
  String daysAgo(int days) => '$days days';

  @override
  String wordSeparator() => ' ';
}