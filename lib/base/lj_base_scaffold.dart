import 'package:flutter/material.dart';
import 'package:lj_pom_kit/base/lj_base_appbar.dart';
import 'package:lj_pom_kit/base/lj_base_tabbar.dart';

class LJBaseScaffold extends Scaffold {
  final Widget child;
  final LJBaseAppBar? appBar;
  final LJBaseTabBar? tabBar;
  LJBaseScaffold({
    Key? key,
    required this.child,
    this.appBar,
    this.tabBar
  }) : super(
    key: key,
    appBar: appBar,
    body: child,
    bottomNavigationBar: tabBar,
  );
}