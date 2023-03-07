import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

/// @time：10/31/22
/// @author：lijiang
/// @description：

class LJBaseApp extends StatelessWidget {
  final String mainPageName;
  final Map<String, WidgetBuilder> pages;
  final Widget Function(BuildContext context, Widget? child)? builder;

  const LJBaseApp(
      {Key? key, required this.mainPageName, required this.pages, this.builder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetMaterialApp(
      initialRoute: mainPageName,
      routes: pages,
      builder: builder ?? EasyLoading.init(),
    );
  }
}
