import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final List<Tab> tabs = <Tab>[
    const Tab(
      text: '单页',
    ),
    const Tab(
      text: 'APP',
    )
  ];

  @override
  void onInit() {
    super.onInit();

    tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void onReady() {}

  @override
  void onClose() {}
}
