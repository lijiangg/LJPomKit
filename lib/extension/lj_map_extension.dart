
import 'dart:convert';

import 'package:lj_pom_kit/extension/lj_string_extension.dart';

extension LJMapExtension on Map {

  /// 将map转化为json字符串
  String toLJJsonString() {
    return jsonEncode(this);
  }

  T? objectLJForKey<T>(Object key) {
    if (containsKey(key)) {
      T value = this[key];
      return value;
    }
    return null;
  }

  String stringLJForKey(Object key) {
    if (containsKey(key)) {
      var value = this[key];
      return "$value";
    }
    return "";
  }

  int intLJForKey(Object key) {
    if (containsKey(key)) {
      var value = this[key];
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
    return 0;
  }

  double doubleLJForKey(Object key) {
    if (containsKey(key)) {
      var value = this[key];
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
    return 0;
  }
}