import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class LJBaseRichText extends StatelessWidget {
  final List<InlineSpan> texts;
  const LJBaseRichText({Key? key, required this.texts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RichText(
      text: TextSpan(children: texts),
      overflow: TextOverflow.ellipsis,
      textScaleFactor: MediaQuery.of(context).textScaleFactor,
      locale: WidgetsBinding.instance?.window.locale,
    );
  }


}
