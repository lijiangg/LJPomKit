
import 'package:flutter/cupertino.dart';
import 'package:lj_pom_kit/base/get/lj_getful_page.dart';
import 'package:lj_pom_kit/base/lj_base_appbar.dart';
import 'package:lj_pom_kit/base/lj_base_scaffold.dart';
import 'package:lj_pom_kit/base/lj_base_state.dart';
import 'package:lj_pom_kit/base/lj_base_tabbar.dart';

class LJBaseTabBarPage extends StatefulWidget {
  final LJBaseAppBar? appBar;
  final List<Widget> pages;
  final int currentIndex;
  final List<LJBaseTabBarItem> tabBarItems;
  const LJBaseTabBarPage({Key? key, this.appBar, required this.pages, required this.tabBarItems,this.currentIndex = 0}) : super(key: key);

  @override
  _LJBaseTabBarPageState createState() => _LJBaseTabBarPageState();
}

class _LJBaseTabBarPageState extends LJBaseState<LJBaseTabBarPage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  stateWillLoad() {
    // TODO: implement stateWillLoad
    super.stateWillLoad();
    _currentIndex = widget.currentIndex;

  }
  @override
  Widget build(BuildContext context) {
    return LJBaseScaffold(
      appBar: widget.appBar,
      child: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              children: widget.pages,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
          LJBaseTabBar(
            items: widget.tabBarItems,
            currentIndex: _currentIndex,
            onTap: (index) {
              _currentIndex = index;
              _pageController.jumpToPage(index);
            },
          )
        ],
      ),
    );
  }
}
