import 'dart:math';

import 'package:flutter/material.dart';

/*
* child内的container颜色会覆盖水波纹的动画 使用backgroundColor即可
* */
class LJBaseButton extends StatelessWidget {
  final Widget child;
  final Function? onTap;

  //动画颜色
  final Color? animationColor;
  final bool animationEnabled;

  //背景颜色
  final Color? backgroundColor;
  final Decoration? decoration;

  const LJBaseButton(
      {Key? key,
      required this.child,
      this.onTap,
      this.animationColor,
      this.animationEnabled = true,
      this.backgroundColor,
      this.decoration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? _animationColor = animationColor;
    if (!animationEnabled) {
      _animationColor = Colors.transparent;
    }
    return Material(
      color: backgroundColor ?? Colors.transparent,
      child: Ink(
        decoration: decoration,
        child: InkResponse(
          // borderRadius: new BorderRadius.all(new Radius.circular(25.0)),
          //点击或者toch控件高亮时显示的控件在控件上层,水波纹下层
          highlightColor: Colors.transparent,
          //点击或者toch控件高亮的shape形状
          highlightShape: BoxShape.rectangle,
          //.InkResponse内部的radius这个需要注意的是，我们需要半径大于控件的宽，如果radius过小，显示的水波纹就是一个很小的圆，
          //水波纹的半径
          // radius: 20.0,
          //水波纹的颜色
          splashColor: _animationColor,
          //true表示要剪裁水波纹响应的界面 false不剪裁 如果控件是圆角不剪裁的话水波纹是矩形
          containedInkWell: true,
          onTap: () {
            if (onTap != null) {
              onTap!();
            }
          },
          child: child,
        ),
      ),
    );
  }
}
