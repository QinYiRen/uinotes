import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../http/request_api.dart';

class SinglePageDetailController extends GetxController {
  SharedPreferences pref = Get.find();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

    likeAction(String uuid, String status) async {
    await RequestRepository.detailLikesActionApi(uuid, status);
  }
}
