import 'dart:ui' as ui show TextHeightBehavior;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LJBaseText extends StatelessWidget {
  final Color? textColor;
  final double fontSize;
  final FontWeight? fontWeight;
  final double lineSpace;
  final String text;
  final int? maxLine;
  final TextOverflow overflow;
  final TextAlign textAlign;
  const LJBaseText(this.text,
      {Key? key,
        this.textColor,
        this.fontSize = 20.0,
        this.fontWeight,
        this.lineSpace = 0,
        this.maxLine,
        this.overflow = TextOverflow.ellipsis,
        this.textAlign = TextAlign.left
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Text(
      text,
      style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          decoration: TextDecoration.none, leadingDistribution: TextLeadingDistribution.even),
      strutStyle:
          StrutStyle(fontSize: fontSize, leading: lineSpace/fontSize),
      overflow: maxLine != null ? overflow : null,
      textScaleFactor: MediaQuery.of(context).textScaleFactor,
      locale: WidgetsBinding.instance?.window.locale,
      maxLines: maxLine,
      textAlign: textAlign,
    );
  }
}
