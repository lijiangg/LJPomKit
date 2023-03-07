
import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:lj_pom_kit/base/lj_base_scaffold.dart';
import 'package:lj_pom_kit/base/lj_base_state.dart';
import 'package:get/get.dart';
import 'package:lj_pom_kit/base/lj_base_text.dart';

import '../lj_base_appbar.dart';
import '../lj_base_tabbar.dart';
import 'lj_get_logic.dart';

abstract class LJGetFulPageState<W extends StatefulWidget, T extends LJGetLogic> extends LJBaseState<W> {

  @override
  Widget build(BuildContext context) {
    return LJBaseScaffold(
      appBar: buildAppBar(context),
      tabBar: buildTabBar(context),
      child: GetBuilder<T>(builder: (logic) {
        return buildChild(context, logic);
      }),
    );
  }
  
  String get title;

  Widget buildChild(BuildContext context, T logic);
  LJBaseTabBar? buildTabBar(BuildContext context) {
    return null;
  }
  LJBaseAppBar? buildAppBar(BuildContext context) {
    return LJBaseAppBar(child: LJAppBarInnerView(titleChild: LJBaseText(title, fontSize: 16, fontWeight: FontWeight.w500)));
  }
}

