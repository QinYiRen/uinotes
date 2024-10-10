import 'package:get/get.dart';
import 'search_ocr_controller.dart';

class SearchOcrBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<SearchOcrController>(() => SearchOcrController());
    }
}
