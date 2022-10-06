import 'package:interview_bit_test/utils/json.dart';

extension IterableDynExt on Iterable<dynamic> {
  Iterable<Map<String, Object?>> toJsons() sync* {
    for (final value in this) {
      final json = JsonUtils.tryCast(value);
      if (json != null) yield json;
    }
  }
}
