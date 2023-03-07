import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lj_pom_kit/base/lj_base_button.dart';
import 'package:get/get.dart';

class LJBaseAppBar extends StatefulWidget implements PreferredSizeWidget {
  //LJAppBarInnerView
  final Widget child;

  const LJBaseAppBar({Key? key, required this.child}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LJBaseAppBarState();
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _LJBaseAppBarState extends State<LJBaseAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: widget.child,
    );
  }
}

class LJAppBarInnerView extends StatelessWidget {
  final Widget? titleChild;
  final Widget? rightChild;

  const LJAppBarInnerView({Key? key, this.titleChild, this.rightChild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              LJBaseButton(
                child: Icon(Icons.arrow_back_ios),
                onTap: () {
                  Get.back();
                },
              ),
              Spacer(),
              if (rightChild != null) rightChild!
            ],
          ),
        ),
        Center(
          child: titleChild,
        )
      ],
    );
  }
}
