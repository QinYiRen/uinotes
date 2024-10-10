import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../http/request_api.dart';
import '../../model/search_app_model.dart';



class SearchAppController extends GetxController {
  SharedPreferences pref = Get.find();
  final dataList = <Result>[].obs;
  final isLoading = false.obs;
  final page = 1.obs;
  final hasMore = 0.obs;
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

  getDataList({bool reset = false, wd}) async {
    var newList = <Result>[];
    try {
      isLoading.value = true;
      if (reset) {
        dataList.clear();
        page.value = 1;
      }
      var res = await RequestRepository.searchApi(wd, 'app', page.value);
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
