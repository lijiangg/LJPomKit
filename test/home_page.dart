import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lj_pom_kit/lj_pom_kit.dart';

import 'package:get/get.dart';


import 'home_logic.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends LJGetFulPageState<HomePage, HomeLogic> {
  final logic = Get.put(HomeLogic());

  @override
  stateWillLoad() {
    // TODO: implement stateWillLoad
    super.stateWillLoad();
    LJDBManager().createDB("tableName", "CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)").then((value) {});
  }

  @override
  Widget buildChild(BuildContext context, logic) {
    // TODO: implement buildChild
    // return LJBaseGridView(
    //   childHeight: 90,
    //   childXCount: 4,
    //   childXSpace: 10,
    //   childYSpace: 20,
    //   builder: (context, index) {
    //     return Container(color: Colors.red);
    //   }, childCount: 10,
    //
    // );
    return Stack(
      children: [
        Listener(
          behavior: HitTestBehavior.translucent,
          onPointerUp: (PointerUpEvent event) {
            print("1111");
          },
          child: GestureDetector(
            // behavior: HitTestBehavior.translucent,
            onTapUp: (e) {
              print("2222");
            },
            child: LJBaseText("⬆️😄🍺🈴️🔪😯🉑️🈳️👀"),
          ),
        ),

      ],
    );
    return LJBaseListView(
      builder: (context, index) => Container(
        color: Colors.red,
        child: Column(
          children: [
            LJBaseButton(
              onTap: () {
                print("222222");
              },
              animationColor: Colors.green,
              child: LJBaseText(
                "${logic.count}",
                lineSpace: 10,
                maxLine: 2,
              ),
            ),
            InkWell(
              onTap: () {
                logic.count = 30;
              },
              child: LJBaseText(
                "点击"
              ),
            ),
            SizedBox(height: 10,)
          ],
        ),
      ),
      childCount: 200,
      onVisibleChilds: (start, end) {
        print("$start $end");
      },
    );
  }

  @override
  // TODO: implement title
  String get title => "xxx";

  @override
  LJBaseViewModel buildViewModel() {
    // TODO: implement buildViewModel
    return LJBaseViewModel();
  }

  @override
  LJBaseAppBar? buildAppBar(BuildContext context) {
    // TODO: implement buildAppBar
    return LJBaseAppBar(
      child: LJAppBarInnerView(
        rightChild: LJBaseText("ss", textColor: Colors.black,),
        titleChild: LJBaseText("ss", textColor: Colors.black,),
      )
    );
  }

  @override
  LJBaseTabBar? buildTabBar(BuildContext context) {
    // TODO: implement buildTabBar
    return LJBaseTabBar(
      items: [
        LJBaseTabBarItem(icon: Icon(Icons.wifi_tethering_sharp), label: "sssss", selectedIcon: Icon(Icons.settings_voice_sharp)),
        LJBaseTabBarItem(icon: Icon(Icons.wifi_tethering_sharp), label: "sssss", selectedIcon: Icon(Icons.settings_voice_sharp)),
        LJBaseTabBarItem(icon: Icon(Icons.wifi_tethering_sharp), label: "sssss", selectedIcon: Icon(Icons.settings_voice_sharp)),
      ],


    );
  }
}
