import 'package:intl/intl.dart';
import 'package:newware_final_project/generated/l10n.dart';
extension StringExtension on String {
  String get formattedTime {
    DateTime time = DateTime.parse(this);
    String formattedTime = DateFormat("HH:mm dd/MM/yyyy").format(
      time.toLocal(),
    );
    return formattedTime;
  }
}
class DateDifferent {
String formatDuration(Duration duration) {
  if (duration.inHours < 1) {
    return '${duration.inMinutes} ${S.current.textMinAgo}';
  } else if (duration.inHours < 24) {
    return '${duration.inHours} ${S.current.textHourAgo}';
  } else {
    return '${duration.inDays} ${S.current.textDayAgo}';
  }
}
  String diffTime(String dateTime) { 
    DateTime now = DateTime.now();
    DateFormat(
      'HH:mm dd/MM/yyyy',
    ).format(now);
    DateTime parsedDateTime = DateFormat('HH:mm dd/MM/yyyy').parse(dateTime);
    Duration difference = now.difference(parsedDateTime);
    String diffTimeString = formatDuration(difference);
    return diffTimeString;
  }

}
