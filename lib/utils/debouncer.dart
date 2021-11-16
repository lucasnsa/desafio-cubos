import 'dart:async';

class Debouncer {
  Duration delay;
  Timer? _timer;

  Debouncer(
    this.delay,
  );

  call(void Function() callback) {
    _timer?.cancel();
    _timer = Timer(delay, callback);
  }

  dispose() {
    _timer?.cancel();
  }
}
