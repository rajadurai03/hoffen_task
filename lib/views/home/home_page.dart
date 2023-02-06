import 'package:flutter/widgets.dart';
import '../../models/home_model.dart';
import '../../widget/dash_container.dart';
import '/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '/navigations/navigations.dart';
import '/utils/constant_utils.dart';
import '/widget/widget.dart';
import '/models/models.dart';
import '/utils/colors_utils.dart';
import '/utils/image_utils.dart';
import '/utils/methods_utils.dart';
import '/widget/widget.dart';
import '/services/services.dart';
import '/controllers/controllers.dart';
import 'dart:math' as math;

class HomePage extends GetView<HomeController> {
  final bool? hideAppBar;

  HomePage({Key? key, this.hideAppBar = false}) : super(key: key);

  @override
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: Toolbar(
          title: "welcome_durai".tr,
          leftsideIcon: menuHumburger,
          leftsideBtnPress: () => Get.back(),
          rightSideWidgets: <Widget>[
            Image.asset(
              menuCart,
              width: kToolbarHeight - 24,
              height: kToolbarHeight - 24,
            ),
            const SizedBox(
              width: 16,
            )
          ],
        ),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: kToolbarHeight / 2,
              ),
              _prograssImage(),
              _prograssIndicator(),
              const SizedBox(
                height: kToolbarHeight / 2,
              ),
              _heading(),
              _menuList(context, controller),
            ],
          ),
        ));
  }

  Widget _prograssImage() {
    return Padding(
      padding: paddingH24,
      child: Image.asset(menuBanner),
    );
  }

  Widget _prograssIndicator() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: 4,
              bottom: 3,
            ),
            child: Text('0',
                textAlign: TextAlign.center,
                style: Get.textTheme.subtitle2!.copyWith(
                  fontWeight: FontWeight.w800,
                ),
                maxLines: 3),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 4,
              bottom: 3,
            ),
            child: Text('50',
                textAlign: TextAlign.center,
                style: Get.textTheme.subtitle2!.copyWith(
                  fontWeight: FontWeight.w800,
                ),
                maxLines: 3),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 4,
              bottom: 3,
            ),
            child: Text('100',
                textAlign: TextAlign.center,
                style: Get.textTheme.subtitle2!.copyWith(
                  fontWeight: FontWeight.w800,
                ),
                maxLines: 3),
          ),
        ],
      ),
    );
  }

  Widget _heading() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            left: 4,
            bottom: 3,
          ),
          child: Text('check_in'.tr,
              textAlign: TextAlign.center,
              style: Get.textTheme.subtitle2!.copyWith(
                fontWeight: FontWeight.w800,
              ),
              maxLines: 3),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 3),
          child: Text('earn_reward'.tr,
              textAlign: TextAlign.center,
              style: Get.textTheme.subtitle2!.copyWith(
                  fontWeight: FontWeight.w800, color: HexColor(orangeColor)),
              maxLines: 3),
        ),
      ],
    );
  }

  Widget _menuList(BuildContext context, HomeController controller) {
    return GridView.builder(
        padding: const EdgeInsets.only(bottom: 8, top: 8),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.listData.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 1,
          crossAxisSpacing: axisSpacing * 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          var data = controller.listData[index];

          return dataTile(context, data);
        });
  }

  Widget dataTile(BuildContext context, MenuModel data) {
    return Container(
        padding: padding10,
        margin: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 0),
        child: CustomPaint(
          painter: DashRectPainter(color: nearlyBlack, strokeWidth: 2, gap: 3),
          child: Container(
            padding: padding10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  data.iconImage.toString(),
                  width: kToolbarHeight -10,
                  height: kToolbarHeight -10,
                ),
                const SizedBox(
                  height: kToolbarHeight /2,
                ),
                Text(data.title.toString(),
                    style: Get.textTheme.subtitle1!
                        .copyWith(fontWeight: FontWeight.w800),
                    maxLines: 3),
              ],
            ),
          ),
        ));
  }
}
