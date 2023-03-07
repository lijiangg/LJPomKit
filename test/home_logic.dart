

import 'package:lj_pom_kit/base/get/lj_get_logic.dart';


class HomeLogic extends LJGetLogic {

  int get count => _count;
  set count(int value) {
    _count = value;
    loadData();
  }
  int _count = 20;
}