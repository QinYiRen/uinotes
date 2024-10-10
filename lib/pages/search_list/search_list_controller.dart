import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../http/request_api.dart';
import '../../model/search_count_model.dart';

class SearchListController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  final selectedTabIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(_handleTabChange);
  }

  @override
  void onReady() {}

  @override
  void onClose() {
    tabController.dispose(); // 清理工作，释放资源
    super.onClose();
  }

  void _handleTabChange() {
    // 当索引发生变化时更新状态
    selectedTabIndex.value = tabController.index;
  }

 Future<List<Types>?> getNum(wd) async {
    var res = await RequestRepository.searchCountApi(wd);
    if (res != null) {
      return res.type;
    }
    return null;
  }
}
