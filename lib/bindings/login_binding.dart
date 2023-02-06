import 'package:get/get.dart';
import '../controllers/controllers.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
