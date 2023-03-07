import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lj_pom_kit/base/lj_base_appbar.dart';
import 'package:lj_pom_kit/base/lj_base_scaffold.dart';
import 'package:lj_pom_kit/base/lj_base_state.dart';
import 'package:lj_pom_kit/base/lj_base_tabbar.dart';
import 'package:provider/provider.dart';

import 'lj_base_vm.dart';

abstract class LJBasePageState<VM extends LJBaseViewModel, T extends StatefulWidget> extends LJBaseState<T>
    with WidgetsBindingObserver {
  VM get viewModel {
    return _viewModel;
  }
  late VM _viewModel;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LJBaseScaffold(
      appBar: buildAppBar(context),
      child: ChangeNotifierProvider<VM>(
        create: (BuildContext context) {
          _viewModel = buildViewModel();
          return _viewModel;
        },
        child: Consumer<VM>(
          builder: (context, vm, child) {
            return buildChild(context);
          },
        ),
      ),
      tabBar: buildTabBar(context),
    );
  }

  VM buildViewModel();
  Widget buildChild(BuildContext context);
  LJBaseTabBar? buildTabBar(BuildContext context) {
    return null;
  }
  LJBaseAppBar? buildAppBar(BuildContext context) {
    return null;
  }
}
