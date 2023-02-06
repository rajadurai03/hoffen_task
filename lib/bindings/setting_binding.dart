import 'package:get/get.dart';

import '../controllers/language_controller.dart';
import '../controllers/theme_controller.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ThemeModeController());
    Get.lazyPut(() => LanguageController());
  }
}
