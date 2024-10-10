import 'package:get/get.dart';
import 'package:uinotes/http/request_api.dart';
import '../../model/search_word_model.dart';

class SearchBoxController extends GetxController {
  var dataList = <SearchWordModel>[].obs;



  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  getDataList(String wd) async {
    var res = await RequestRepository.searchWordApi(wd, 'pin');
    if (res != null) {
      dataList.value = res;
    }
  }


}
