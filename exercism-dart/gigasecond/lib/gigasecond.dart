// ignore_for_file: unused_local_variable

DateTime addGigasecondTo(final DateTime dateTime) {
  int secondsSinceEpoch = dateTime.millisecondsSinceEpoch + 1000000000 * 1000;

  // isUtc: subtract local timezone
  DateTime result =
      DateTime.fromMillisecondsSinceEpoch(secondsSinceEpoch, isUtc: true);
  return result;
}
