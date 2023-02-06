import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/utils/image_utils.dart';
import '../../../controllers/controllers.dart';




class SplashPage extends StatelessWidget {
 SplashPage({Key? key}) : super(key: key);

  final SplashController controller = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
             children: [
             Center(
                  child: Image.asset(
                      splash,  width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      fit:BoxFit.fill
                  ))

             ],
            ));
  }
}

