import 'package:get/get.dart';
import 'package:uinotes/http/request_api.dart';

class ExchangeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  exchangeVip(code) async {
    await RequestRepository.memberExchangeApi(code);
  }
}
