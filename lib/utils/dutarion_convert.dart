String formatDuration(int minutes) {
  final _time = Duration(minutes: minutes);

  return '${_time.inHours}h ${_time.inMinutes.remainder(60)}m';
}
