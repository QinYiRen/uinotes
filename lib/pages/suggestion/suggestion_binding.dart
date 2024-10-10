import 'package:get/get.dart';
import 'suggestion_controller.dart';

class SuggestionBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<SuggestionController>(() => SuggestionController());
    }
}
