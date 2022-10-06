import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'interview.freezed.dart';

part 'interview.g.dart';

@freezed
class Interview with _$Interview {
  const Interview._();

  factory Interview.empty() => Interview.raw(
        name: 'Empty',
        uuid: const Uuid().v1(),
        start: DateTime.now(),
        end: DateTime.now(),
      );

  const factory Interview.raw({
    required String uuid,
    required String name,
    required DateTime start,
    required DateTime end,
    @Default({}) Set<String> participants,
  }) = _Interview;

  factory Interview.fromJson(Map<String, Object?> json) =>
      _$InterviewFromJson(json);

  bool isClash(DateTime start, DateTime end) =>
      !(this.start.isAfter(end) || this.end.isBefore(start));
}
