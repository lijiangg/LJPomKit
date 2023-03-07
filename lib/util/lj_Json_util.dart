
import 'dart:convert';

/// @time：11/4/22
/// @author：lijiang
/// @description：

class LJJsonUtil {
  static String toJson(dynamic object) {
    return json.encode(object);
  }

  static dynamic jsonTo(String str) {
    return json.decode(str);
  }
}