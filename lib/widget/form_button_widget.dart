import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/utils/constant_utils.dart';

class FormButtonWidget extends StatelessWidget {
  const FormButtonWidget(
      {Key? key,
      required this.color,
      required this.text,
      required this.onPressed})
      : super(key: key);

  final Color color;
  final Widget text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: Get.width - 10,
        child: MaterialButton(
            elevation: 0,
            onPressed: onPressed,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            color: color,
            shape:
                RoundedRectangleBorder(borderRadius: circular8),
            child: text));
  }
}
