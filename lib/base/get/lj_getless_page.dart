
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../lj_base_appbar.dart';
import '../lj_base_scaffold.dart';
import '../lj_base_tabbar.dart';
import '../lj_base_text.dart';
import 'lj_get_logic.dart';

abstract class LJGetLessPage<T extends LJGetLogic> extends StatelessWidget {
  const LJGetLessPage({Key? key}) : super(key: key);

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