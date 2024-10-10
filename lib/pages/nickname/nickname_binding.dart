import 'package:get/get.dart';
import 'nickname_controller.dart';

class NicknameBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<NicknameController>(() => NicknameController());
    }
}
