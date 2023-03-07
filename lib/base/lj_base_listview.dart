import 'package:flutter/cupertino.dart';
import 'package:lj_pom_kit/base/lj_base_state.dart';

/// @time：11/1/22
/// @author：lijiang
/// @description：

class LJBaseListView extends StatefulWidget {
  final Widget Function(BuildContext context, int index) builder;
  final int childCount;
  final Function(int startIndex, int endIndex)? onVisibleChilds;
  final List<Widget>? headerSliverList;
  final List<Widget>? footerSliverList;
  const LJBaseListView(
      {Key? key,
      required this.builder,
      required this.childCount,
      this.onVisibleChilds,
      this.headerSliverList,
      this.footerSliverList})
      : super(key: key);

  @override
  State<LJBaseListView> createState() => _LJBaseListViewState();
}

class _LJBaseListViewState extends LJBaseState<LJBaseListView> {

  int _startScrollIndex = 0;
  int _endSCrollIndex = 0;

  @override
  stateDidLoad() {
    // TODO: implement stateDidLoad
    super.stateDidLoad();
    if (widget.onVisibleChilds != null) {
      widget.onVisibleChilds!(_startScrollIndex, _endSCrollIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (Notification notification) {
        if (notification is ScrollEndNotification) {
          if (widget.onVisibleChilds != null) {
            widget.onVisibleChilds!(_startScrollIndex, _endSCrollIndex);
          }
        }
        return true;
      },
      child: CustomScrollView(
        slivers: [
          if (widget.headerSliverList != null) ...widget.headerSliverList!,
          SliverList(
              delegate: LJBaseListDelegate(
                  childCount: widget.childCount,
                  builder: widget.builder,
                  onVisibleChilds: (start, end) {
                    _startScrollIndex = start;
                    _endSCrollIndex = end;
                  })),
          if (widget.footerSliverList != null) ...widget.footerSliverList!
        ],
      ),
    );
  }
}

class LJBaseListDelegate extends SliverChildBuilderDelegate {
  final Function(int startIndex, int endIndex)? onVisibleChilds;

  const LJBaseListDelegate(
      {required Widget Function(BuildContext, int) builder,
      required int childCount,
      this.onVisibleChilds})
      : super(builder, childCount: childCount);

  // @override
  // double? estimateMaxScrollOffset(int firstIndex, int lastIndex, double leadingScrollOffset, double trailingScrollOffset) {
  //   // TODO: implement estimateMaxScrollOffset
  //   if (onVisibleChilds != null) {
  //     onVisibleChilds!(firstIndex, lastIndex);
  //   }
  //   return super.estimateMaxScrollOffset(firstIndex, lastIndex, leadingScrollOffset, trailingScrollOffset);
  // }

  @override
  void didFinishLayout(int firstIndex, int lastIndex) {
    // TODO: implement didFinishLayout
    super.didFinishLayout(firstIndex, lastIndex);
    if (onVisibleChilds != null) {
      onVisibleChilds!(firstIndex, lastIndex);
    }
  }
}
