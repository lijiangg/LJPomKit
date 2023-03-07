
import 'package:decimal/decimal.dart';

extension LJDoubleExtension on double {
  String toLJString({int? zeroCount}) {
    if (zeroCount != null) {
      return Decimal.tryParse(toString())?.toStringAsFixed(zeroCount!) ?? "";
    }
    return Decimal.tryParse(toString()).toString();
  }

}