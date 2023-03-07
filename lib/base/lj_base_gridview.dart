import 'package:flutter/cupertino.dart';

/// @time：11/1/22
/// @author：lijiang
/// @description：

class LJBaseGridView extends StatelessWidget {
  final double childHeight;
  final double childXSpace;
  final double childYSpace;
  final int childXCount;
  final Widget Function(BuildContext context, int index) builder;
  final int childCount;

  const LJBaseGridView(
      {Key? key,
      this.childHeight = 40,
      this.childXSpace = 0,
      this.childYSpace = 0,
      this.childXCount = 2,
      required this.builder,
      required this.childCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        //计算child size
        double childWidth =
            (constraints.maxWidth - (childXCount - 1) * childXSpace) /
                childXCount;
        return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: childWidth / childHeight,
              crossAxisCount: childXCount,
              mainAxisSpacing: childYSpace,
              crossAxisSpacing: childXSpace,
            ),
            itemBuilder: builder,
            itemCount: childCount
        );
      },
    );
  }
}
