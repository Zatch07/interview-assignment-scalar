import 'package:flutter/material.dart';

extension DateTimeExt on DateTime {
  DateTime setTime(TimeOfDay time) {
    return DateTime(year, month, day, time.hour, time.minute, second,
        millisecond, microsecond);
  }

  DateTime mergeTime(DateTime dateTime) {
    return merge(dateTime, hour: true, minute: true);
  }

  DateTime merge(
    DateTime dateTime, {
    bool year = false,
    bool month = false,
    bool day = false,
    bool hour = false,
    bool minute = false,
    bool second = false,
    bool millisecond = false,
    bool microsecond = false,
  }) {
    return DateTime(
      (year ? dateTime.year : this.year),
      (month ? dateTime.month : this.month),
      (day ? dateTime.day : this.day),
      (hour ? dateTime.hour : this.hour),
      (minute ? dateTime.minute : this.minute),
      (second ? dateTime.second : this.second),
      (millisecond ? dateTime.millisecond : this.millisecond),
      (microsecond ? dateTime.microsecond : this.microsecond),
    );
  }
}
