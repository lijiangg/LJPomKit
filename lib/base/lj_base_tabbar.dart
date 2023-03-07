import 'package:flutter/material.dart';
import 'package:lj_pom_kit/base/lj_base_state.dart';

/// @time：10/31/22
/// @author：lijiang
/// @description：

class LJBaseTabBar extends StatefulWidget {
  final List<LJBaseTabBarItem> items;
  final Function(int index)? onTap;
  const LJBaseTabBar(
      {Key? key, this.items = const [], this.currentIndex = 0, this.onTap})
      : super(key: key);
  final int currentIndex;

  @override
  State<LJBaseTabBar> createState() => _LJBaseTabBarState();
}

class _LJBaseTabBarState extends LJBaseState<LJBaseTabBar> {
  int _currentIndex = 0;

  @override
  stateWillLoad() {
    // TODO: implement stateWillLoad
    super.stateWillLoad();
    _currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: List.generate(widget.items.length, (index) => widget.items[index]),
      onTap: (index) {
        setState(() {
          _currentIndex = index;
          if (widget.onTap != null) {
            widget.onTap!(index);
          }
        });
      },
      currentIndex: _currentIndex,
    );
  }
}

class LJBaseTabBarItem extends BottomNavigationBarItem {
  final Widget icon;
  final Widget? selectedIcon;
  final String label;
  final Color backgroundColor;

  //长按提示
  final longPressAlertText;

  const LJBaseTabBarItem(
      {required this.icon,
      this.selectedIcon,
      required this.label,
      this.backgroundColor = Colors.white,
      this.longPressAlertText = ""})
      : super(
            icon: icon,
            label: label,
            activeIcon: selectedIcon,
            tooltip: longPressAlertText);
}
