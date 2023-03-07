
import 'dart:convert';

import 'lj_string_extension.dart';

extension LJListExtension on List {
  /// 将list转化为json字符串
  String toLJJsonString() {
    return jsonEncode(this);
  }

  T? objectLJAtIndex<T>(int index) {
    if (length <= index) {
      return null;
    }
    T value = this[index];
    return value;
  }

  String stringLJAtIndex(int index) {
    if (length <= index) {
      return "";
    }
    var value = this[index];
    return "$value";
  }

  int? intLJAtIndex(int index) {
    if (length <= index) {
      return 0;
    }
    var value = this[index];
    if (value is num) {
      num result = value;
      return result.toInt();
    }
    if (value is String) {
      String result = value;
      return result.toLJInt();
    }
    return 0;
  }

  double doubleLJAtIndex(int index) {
    if (length <= index) {
      return 0.0;
    }
    var value = this[index];
    if (value is num) {
      num result = value;
      return result.toDouble();
    }
    if (value is String) {
      String result = value;
      return result.toLJDouble();
    }
    return 0;
  }
}