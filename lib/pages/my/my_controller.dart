import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../http/request_api.dart';
import '../../model/likes_model.dart';

class MyController extends GetxController {
  SharedPreferences pref = Get.find();
  final isTitleCentered = false.obs;
  final dataList = <LikesModel>[].obs;
  final isLoading = false.obs;
  final page = 1.obs;
  final hasMore = true.obs;
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
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  void onClose() {}

  getDataList({bool reset = false}) async {
    var newList = <LikesModel>[];
    try {
      isLoading.value = true;
      if (reset) {
        dataList.clear();
        page.value = 1;
      }
      var res = await RequestRepository.likesApi(page.value);
      newList = res;

      dataList.addAll(newList);

      page.value++;
      hasMore.value = newList.isNotEmpty;
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  likeAction(String uuid, String status) async {
    await RequestRepository.detailLikesActionApi(uuid, status);
  }

  void scrollListener() {
    isTitleCentered.value = scrollController.offset > 180;
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
