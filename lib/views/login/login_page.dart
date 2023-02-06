import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../navigations/route_name.dart';
import '../../utils/methods_utils.dart';
import '/utils/colors_utils.dart';
import '/utils/image_utils.dart';
import '../../../widget/form_button_widget.dart';
import '../../../widget/text_field_component.dart';
import '../../controllers/controllers.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image:
            DecorationImage(image: AssetImage(spBackground), fit: BoxFit.fill),
      ),
      child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                const SizedBox(height: kToolbarHeight),
                Text('login'.tr,
                    style: context.textTheme.headline6!
                        .merge(const TextStyle(fontSize: 20)),
                    textAlign: TextAlign.center),
                const SizedBox(height: 20),
                ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Image.asset(appLogo,
                        fit: BoxFit.cover, height: kToolbarHeight * 2)),
                const SizedBox(height: 40),
                _loginFormWidget(),
                _forgotPasswordWidget(),
                _emailLoginPress(),
                _divider(context),
                _faceLoginPress(),
              ]))),
    ));
  }

  _loginFormWidget() => Column(children: [
        TextFieldComponent(
          labelText: 'email'.tr,
          controller: controller.emailController,
          textInputAction: TextInputAction.next,
          focusNode: controller.emailFocusNode,
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 16),
        GetBuilder<LoginController>(builder: (controller) {
          return TextFieldComponent(
            labelText: 'password'.tr,
            controller: controller.passwordController,
            textInputAction: TextInputAction.done,
            focusNode: controller.passwordFocusNode,
            obscureText: controller.obscurePasswordText.value,
            suffixIcon: GestureDetector(
              onTap: () {
                controller.obscurePasswordText.value =
                    !controller.obscurePasswordText.value;
                controller.update();
              },
              child: Icon(
                controller.obscurePasswordText.value
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: HexColor(unSelectdTabColor),
              ),
            ),
          );
        }),
      ]);

  _forgotPasswordWidget() =>
      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        TextButton(onPressed: () {}, child: Text('forget_password'.tr))
      ]).paddingSymmetric(horizontal: 0);

  _emailLoginPress() => FormButtonWidget(
        onPressed: () {
          controller.validation();
        },
        color: Colors.grey,
        text: Text('login_with_email'.tr,
            style: Get.textTheme.headline6!
                .merge(const TextStyle(color: textFieldColor))),
      ).paddingSymmetric(vertical: 10);

  _divider(BuildContext context) => Row(
        children: [
          Expanded(
            child: Divider(
              color: Get.theme.colorScheme.secondary,
            ),
          ),
          Text('or'.tr,
              style: context.textTheme.headline6!
                  .merge(TextStyle(color: Get.theme.colorScheme.secondary)),
              textAlign: TextAlign.center),
          Expanded(
            child: Divider(
              color: Get.theme.colorScheme.secondary,
            ),
          ),
        ],
      ).paddingSymmetric(vertical: 20);

  _faceLoginPress() => FormButtonWidget(
        onPressed: () {
          Get.toNamed(RouteName.languageRoute);
        },
        color: Get.theme.colorScheme.secondary,
        text: Text('sign_in_with_face_id'.tr,
            style: Get.textTheme.headline6!
                .merge(const TextStyle(color: textFieldColor))),
      ).paddingSymmetric(vertical: 10);
}
