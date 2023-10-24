import 'package:intl/intl.dart';
import 'package:newware_final_project/common/app_texts.dart';

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
    return '${duration.inMinutes} ${AppTexts.textMinAgo}';
  } else if (duration.inHours < 24) {
    return '${duration.inHours} ${AppTexts.textHourAgo}';
  } else {
    return '${duration.inDays} ${AppTexts.textDayAgo}';
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
