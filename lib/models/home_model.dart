
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/image_utils.dart';

class MenuModel{

  int? id;
  String? title;
  String? message;
  String? iconImage;
  bool? isChecked;

  MenuModel(
      {this.id,
        this.iconImage,
        this.title,
        this.message,
        this.isChecked});

  bool? get getchecked => isChecked  ;

  set setchecked(bool value) {
    isChecked = value;
  }
}

class HomeMenu {


  List<MenuModel> menusDataList = [
    MenuModel(
        id: 1,
        title: 'location_list'.tr,
        iconImage: menuLocationList,
        isChecked: false),
    MenuModel(
        id: 2,
        title: 'forget_card_code'.tr,
        iconImage: menuCheckIn,
        isChecked: false),
    MenuModel(
        id: 3,
        title: 'egift_card'.tr,
        iconImage:menuEGift, isChecked: false),

    MenuModel(
        id: 4,
        title: 'refer_a_friend'.tr,
        iconImage: menuReferaFriend,
        isChecked: false),
    MenuModel(
        id: 5,
        title: 'order_history'.tr,
        iconImage: menuOrderHistory,
        isChecked: false),
    MenuModel(
        id: 6,
        title: 'facebook'.tr,
        iconImage: menuOrderHistory,
        isChecked: false),
  ];


}