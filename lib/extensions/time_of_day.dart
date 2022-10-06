import 'package:flutter/material.dart';
import 'package:interview_bit_test/extensions/date_time.dart';

extension TimeOfDayExt on TimeOfDay {
  DateTime toDateTime() {
    return DateTime.now().setTime(this);
  }
}
