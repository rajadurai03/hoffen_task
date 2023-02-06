import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoffensoft_task/utils/colors_utils.dart';
import '../models/setting_response.dart';
import '../navigations/route_name.dart';
import '../utils/image_utils.dart';
import '../utils/methods_utils.dart';
import '../widget/error.dart';
import '/services/api_provider.dart';
import '../widget/loading_overlay.dart';
import '../models/setting_response.dart';
import '../services/settings_service.dart';

class LoginController extends GetxController {
  final SettingResponse settings = Get.find<SettingsService>().setting.value;

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  RxBool obscurePasswordText = true.obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void validation() {
    if (validateEmail(emailController.text)!) {
      if (validatePassword(passwordController.text)!) {
        getApiData(emailController.text, passwordController.text);
      } else {
        Get.showSnackbar(
          GetSnackBar(
            title: 'password'.tr,
            message: 'check_password'.tr,
            icon: const Icon(
              errorIcon,
              color: Colors.white,
            ),
            backgroundColor: Colors.redAccent,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } else {
      Get.showSnackbar(
        GetSnackBar(
          title: 'email'.tr,
          message: 'check_email'.tr,
          icon: const Icon(errorIcon, color: Colors.white),
          backgroundColor: Colors.redAccent,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  void getApiData(String email, String password) {
    var input = {
      "fields": {
        "username": email, //b3@gmail.com
        "password": password //"Qwerty@123"
      },
      "cardTemplateCode": 0,
      "scope": "user_read account_read account_write user_write",
      "merchantId": 60019,
      "grant_type": "http:\/\/paytronix.com\/oauth\/fieldset",
      "authentication": "anonymous",
      "integrationDetail": "iOS 16.2",
      "client_id": "y5mjgC9v2raWoMkQ_1jJgZhMEinFx9Zl4fb7105Slp"
    };
    Get.dialog(loadingOverlay());
    APIProvider().loginAPI(
      params: input,
      onSuccess: (data) {
        Get.back();
        Get.offNamed(RouteName.homeRoute);
      },
      onError: (error) {
        Get.back();
        print(error);

        Get.bottomSheet(
          SizedBox(
            height: 300,
            child: Column(
              children: [
                const SizedBox(height: 20),
                ErrorMessage(
                  title: 'Login Error',
                  image: errorDataIcons,
                  message: error.toString(),
                )
              ],
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        );
      },
    );
    update();
  }
}
