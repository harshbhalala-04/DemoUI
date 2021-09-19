import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenController extends GetxController {
  final selectedPage = 0.obs;

  void changePage(int pageNum) {
    selectedPage.value = pageNum;
    print(pageNum.toDouble());
    print('This is double value');
    
  }

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }
}
