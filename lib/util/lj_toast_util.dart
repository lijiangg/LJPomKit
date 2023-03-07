import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LJToastUtil {
  static show(String message, {Duration? duration, EasyLoadingMaskType? maskType, bool? dismissOnTap = false}) {
    EasyLoading.showToast(message, duration: duration, toastPosition: EasyLoadingToastPosition.center, maskType: maskType ?? EasyLoadingMaskType.clear, dismissOnTap: dismissOnTap ?? false);
  }

  static showProgress({String message = "", Widget? indicator, EasyLoadingMaskType? maskType, bool? dismissOnTap = false}) {
    EasyLoading.show(status: message, indicator: indicator, maskType: maskType, dismissOnTap: dismissOnTap);
  }

  static dismiss({bool animation = true}) {
    EasyLoading.dismiss(animation: animation);
  }
}