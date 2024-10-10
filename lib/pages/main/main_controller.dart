import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainController extends GetxController {
    SharedPreferences pref = Get.find();
  RxInt currentIndex = 0.obs;
  late PageController pageController;

  @override
  void onInit() {
    pageController = PageController(initialPage: currentIndex.value);
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  changeIndex(value) => currentIndex.value = value;
}
