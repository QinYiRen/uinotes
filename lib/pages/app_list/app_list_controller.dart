import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spinner_box/spinner_box.dart';

import '../../http/request_api.dart';
import '../../model/search_app_model.dart';

class AppListController extends GetxController {
  SharedPreferences pref = Get.find();
  final companyList = [
    SpinnerEntity(
      key: '全部',
      items: [
        SpinnerItem(name: '全部', result: 0, selected: true),
        SpinnerItem(name: '阿里', result: 1, selected: false),
        SpinnerItem(name: '爱奇艺', result: 4, selected: false),
        SpinnerItem(name: '百度', result: 7, selected: false),
        SpinnerItem(name: '京东', result: 2, selected: false),
        SpinnerItem(name: '快手', result: 8, selected: false),
        SpinnerItem(name: '美团', result: 10, selected: false),
        SpinnerItem(name: '苹果', result: 11, selected: false),
        SpinnerItem(name: '腾讯', result: 5, selected: false),
        SpinnerItem(name: '网易', result: 9, selected: false),
        SpinnerItem(name: '小米', result: 12, selected: false),
        SpinnerItem(name: '字节', result: 6, selected: false),
        SpinnerItem(name: '其他', result: 3, selected: false),
      ],
    ),
  ].obs;
  final catalogueList = [
    SpinnerEntity(
      key: '全部',
      items: [
        SpinnerItem(name: '全部', result: 0, selected: true),
        SpinnerItem(name: '报刊杂志', result: 11, selected: false),
        SpinnerItem(name: '财务', result: 2, selected: false),
        SpinnerItem(name: '参考', result: 15, selected: false),
        SpinnerItem(name: '导航', result: 20, selected: false),
        SpinnerItem(name: '工具', result: 14, selected: false),
        SpinnerItem(name: '购物', result: 13, selected: false),
        SpinnerItem(name: '健康健美', result: 7, selected: false),
        SpinnerItem(name: '教育', result: 9, selected: false),
        SpinnerItem(name: '旅游', result: 17, selected: false),
        SpinnerItem(name: '美食佳饮', result: 12, selected: false),
        SpinnerItem(name: '商务', result: 19, selected: false),
        SpinnerItem(name: '社交', result: 3, selected: false),
        SpinnerItem(name: '摄影与录像', result: 4, selected: false),
        SpinnerItem(name: '生活', result: 1, selected: false),
        SpinnerItem(name: '体育', result: 18, selected: false),
        SpinnerItem(name: '天气', result: 21, selected: false),
        SpinnerItem(name: '图书', result: 10, selected: false),
        SpinnerItem(name: '图形和设计', result: 23, selected: false),
        SpinnerItem(name: '效率', result: 16, selected: false),
        SpinnerItem(name: '新闻', result: 5, selected: false),
        SpinnerItem(name: '医疗', result: 22, selected: false),
        SpinnerItem(name: '音乐', result: 6, selected: false),
        SpinnerItem(name: '娱乐', result: 8, selected: false),
      ],
    ),
  ].obs;
  final dataList = <Result>[].obs;
  final isLoading = false.obs;
  final page = 1.obs;
  final hasMore = 0.obs;
  final conpany = 0.obs;
  final catalogue = 0.obs;
    final showButton = false.obs;
   final ScrollController scrollController = ScrollController();
  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(scrollListener);
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

    @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  getDataList({bool reset = false}) async {
    var newList = <Result>[];
    try {
      isLoading.value = true;
      if (reset) {
        dataList.clear();
        page.value = 1;
      }
      var res = await RequestRepository.searchAppApi(
          conpany.value, catalogue.value, page.value);
  
      bool isLogin = false;
      bool isVip = false;

      if (res.data != null && res.statusCode != 204) {
        var data = SearchAppModel.fromJson(res.data);

        // 获取isLogin和isVip的值，默认为false
        isLogin = data.isLogin ?? false;
        isVip = data.isVip ?? false;

        newList = data.result ?? [];
        dataList.addAll(newList);
        page.value++;
      }

       if (res.statusCode == 204) {
        hasMore.value = 3; // 数据为空或者状态码为204时，未登录
        if (!isLogin) {
          hasMore.value = 1; // 未登录
        } else if (isLogin && !isVip) {
          hasMore.value = 2; // 已登录但不是VIP
        } else if (isLogin && isVip) {
          hasMore.value = 3; // 已登录且是VIP
        }
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

    void scrollListener() {
    if (scrollController.offset >= 400) {
      showButton.value = true;
    } else {
      showButton.value = false;
    }
  }

  void scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
