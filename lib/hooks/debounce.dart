import 'dart:async';
import 'dart:ui';
class Debouncer {
  final int milliseconds;
  Timer? _timer;
  Debouncer({this.milliseconds=1500});
  run(VoidCallback action) {
    if (null != _timer) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}