
import 'dart:ui';

import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';

extension LJStringExtension on String {
  double toLJDouble() {
    return Decimal.tryParse(this)?.toDouble() ?? 0.0;
  }

  int toLJInt() {
    return Decimal.tryParse(this)?.toBigInt().toInt() ?? 0;
  }

  String toLJFixedZero({int? zeroCount}) {
    if (zeroCount != null) {
      return Decimal.tryParse(this)?.toStringAsFixed(zeroCount) ?? "";
    } else {
      return Decimal.tryParse(this).toString();
    }
  }

  ///计算文本大小
  ///计算文本大小
  Size boundingLJTextSize(
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
        locale: WidgetsBinding.instance!.window.locale,
        maxLines: maxLines,
        textDirection: TextDirection.ltr,
        text: TextSpan(text: text, style: style),
        textScaleFactor: MediaQuery.of(context).textScaleFactor);
    //设置layout
    painter.layout(maxWidth: maxWidth);

    return painter.size;
  }
}