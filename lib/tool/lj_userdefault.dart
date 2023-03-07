/// @time：11/2/22 
/// @author：lijiang
/// @description：

import 'package:shared_preferences/shared_preferences.dart';
import 'package:lj_pom_kit/util/lj_json_util.dart';

class LJUserDefault {
  factory LJUserDefault() => LJUserDefault._instance;
  static final LJUserDefault _instance = LJUserDefault._private();
  LJUserDefault._private();

}

extension LJUserDefaultGetExtion on LJUserDefault {
  Future<bool?> boolForKey(String key) {
    return SharedPreferences.getInstance().then((value) {
      return value.getBool(key);
    });
  }

  Future<double?> doubleForKey(String key) {
    return SharedPreferences.getInstance().then((value) {
      return value.getDouble(key);
    });
  }

  Future<int?> intForKey(String key) {
    return SharedPreferences.getInstance().then((value) {
      return value.getInt(key);
    });
  }

  Future<String?> stringForKey(String key) {
    return SharedPreferences.getInstance().then((value) {
      return value.getString(key);
    });
  }

  Future<List?> listForKey(String key) async {
    String? value = await stringForKey(key);
    if (value == null) {
      return null;
    }
    var obj = LJJsonUtil.jsonTo(value);
    if (obj is List) {
      return obj;
    } else {
      return null;
    }
  }

  Future<Map?> mapForKey(String key) async {
    String? value = await stringForKey(key);
    if (value == null) {
      return null;
    }
    var obj = LJJsonUtil.jsonTo(value);
    if (obj is Map) {
      return obj;
    } else {
      return null;
    }
  }
}

extension LJUserDefaultSetExtension on LJUserDefault {
  Future<bool> setObjectForKey(dynamic obj, String key) {
    if (obj is String) {
      return setStringForKey(obj, key);
    } else if (obj is double) {
      return setDoubleForKey(obj, key);
    } else if (obj is bool) {
      return setBoolForKey(obj, key);
    } else if (obj is Map) {
      return setMapForKey(obj, key);
    } else if (obj is List) {
      return setListForKey(obj, key);
    } else if (obj is int) {
      return setIntForKey(obj, key);
    }
    return Future.value(false);
  }

  Future<bool> setListForKey(List obj, String key) {
    String jsonObj = LJJsonUtil.toJson(obj);
    return setStringForKey(jsonObj, key);
  }

  Future<bool> setMapForKey(Map obj, String key) {
    String jsonObj = LJJsonUtil.toJson(obj);
    return setStringForKey(jsonObj, key);
  }

  Future<bool> setBoolForKey(bool obj, String key) async {
    var _preferences = await SharedPreferences.getInstance();
    return _preferences!.setBool(key, obj);
  }

  Future<bool> setStringForKey(String obj, String key) async {
    var _preferences = await SharedPreferences.getInstance();
    return _preferences!.setString(key, obj);
  }

  Future<bool> setIntForKey(int obj, String key) async {
    var _preferences = await SharedPreferences.getInstance();
    return _preferences!.setInt(key, obj);
  }

  Future<bool> setDoubleForKey(double obj, String key) async {
    var _preferences = await SharedPreferences.getInstance();
    return _preferences!.setDouble(key, obj);
  }
}

extension LJUserDefaultDeleteExtension on LJUserDefault {
  Future<bool> remove(String key) async {
    var _preferences = await SharedPreferences.getInstance();
    return _preferences.remove(key);
  }
}