import 'dart:developer';

abstract class JsonUtils {
  static Map<String, Object?>? tryCast(value) {
    try {
      return Map<String, Object?>.from(value);
    } catch (err) {
      final errMsg = 'Cannot form json of value: $value';
      log(errMsg, name: '$JsonUtils');
    }
    return null;
  }
}
