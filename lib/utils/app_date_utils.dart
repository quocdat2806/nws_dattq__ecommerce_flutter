import 'package:intl/intl.dart';

extension StringExtension on String {
  String get formattedTime {
    DateTime time = DateTime.parse(this);
    String formattedTime = DateFormat("HH:mm dd/MM/yyyy").format(
      time.toLocal(),
    );
    return formattedTime;
  }
}

class DateDiffrent {
String formatDuration(Duration duration) {
  if (duration.inHours < 1) {
    return '${duration.inMinutes} phút trước ';
  } else if (duration.inHours < 24) {
    return '${duration.inHours} giờ trước';
  } else {
    return '${duration.inDays} ngày trước';
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
