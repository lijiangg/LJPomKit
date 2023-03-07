import 'dart:ui';

import 'package:flutter/cupertino.dart';

/// @time：11/1/22
/// @author：lijiang
/// @description：

class LJTextUtil {
  ///计算文本大小
  Size boundingTextSize(
      BuildContext context, //当前界面上下文
      String? text, //文本内容
      TextStyle style,
      int maxLines, //文本支持最大多少行
      double maxWidth, //文本框的最大宽度
      ) {
    if (text == null || text.isEmpty) {
      return Size.zero;
    }
    //TextPainter
    final TextPainter painter = TextPainter(
        locale: WidgetsBinding.instance?.window.locale,
        maxLines: maxLines,
        textDirection: TextDirection.ltr,
        text: TextSpan(text: text, style: style),
        textScaleFactor: MediaQuery.of(context).textScaleFactor
    );
    //设置layout
    painter.layout(maxWidth: maxWidth);
    return painter.size;
  }
}