import 'dart:ui';

import 'package:flutter/material.dart';

class LJBaseTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final TextStyle? placeholderTextStyle;
  final String placeholder;

  /*
  * text 文本输入键盘
  * multiline 多行文本，需和maxLines配合使用(设为null或大于1)
  * number 数字；会弹出数字键盘
  * phone 优化后的电话号码输入键盘；会弹出数字键盘并显示“* #”
  * datetime 优化后的日期输入键盘；Android上会显示“: -”
  * emailAddress 优化后的电子邮件地址；会显示“@ .”
  * url 优化后的url输入键盘； 会显示“/ .”
  * */
  final TextInputType keyboardType;
  final double fontSize;
  final Color textColor;
  final double lineSpace;
  final FontWeight fontWeight;
  final int maxLine;
  final bool enabled;

  const LJBaseTextfield({Key? key,
    this.controller,
    this.placeholderTextStyle,
    this.placeholder = "",
    this.keyboardType = TextInputType.text,
    this.fontSize = 14.0,
    this.textColor = Colors.black,
    this.fontWeight = FontWeight.w400,
    this.maxLine = 1,
    this.lineSpace = 0,
    this.enabled = true
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextField(
      controller: controller,
      style: TextStyle(
        fontSize: fontSize,
        color: textColor,
        fontWeight: fontWeight
      ),
      strutStyle: StrutStyle(
        fontSize: fontSize,
        leading: lineSpace/fontSize
      ),
      decoration: InputDecoration(
          isCollapsed: true,
          filled: true,
          hintStyle: placeholderTextStyle,
          hintText: placeholder,
          fillColor: Colors.transparent,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.zero),
      keyboardType: keyboardType,
      maxLines: maxLine,
      enabled: enabled,
    );
  }
}
