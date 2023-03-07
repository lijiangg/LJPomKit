
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lj_pom_kit/base/lj_base_state.dart';


abstract class LJGetLogic extends GetxController {

  @override
  onInit() {
    super.onInit();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  loadData(){
    update();
  }
}