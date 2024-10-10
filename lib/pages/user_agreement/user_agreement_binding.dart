import 'package:get/get.dart';
import 'user_agreement_controller.dart';

class UserAgreementBinding extends Bindings {
    @override
    void dependencies() {
    Get.lazyPut<UserAgreementController>(() => UserAgreementController());
    }
}
