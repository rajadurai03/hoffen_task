import 'dart:io';

import 'package:get/get.dart';

import '../models/home_model.dart';
import '../models/setting_response.dart';
import '../services/services.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin, StateMixin {
  var isLoading = false.obs;
  final SettingResponse settings = Get.find<SettingsService>().setting.value;
List<MenuModel> listData = List<MenuModel>.empty(growable: true).obs;



  @override
  void onInit() {
    super.onInit();
    print('ONINIT IS OPENED');

 getmenuData();

  }

  @override
  void onClose() {

  }



  void  getmenuData(){

    listData = HomeMenu().menusDataList;

  }

  // void getProductListAPI() {
  //   Map<String, dynamic> input = {"id": 1};
  //   change(null, status: RxStatus.loading());
  //   APIProvider().productListAPI(
  //     params: input,
  //     onSuccess: (data) {
  //       // productModel = data;
  //       //
  //       // if (productModel.status == 'Success' &&
  //       //     productModel.statusCode == 200) {
  //       //   totalDevice.value = productModel.count!;
  //       //   dashboardList.value = productModel.data!;
  //       //   filterData.value = productModel.data!;
  //       //   graphList.value = productModel.graphData!;
  //       //
  //       //   if (dashboardList.value.isEmpty) {
  //       //     change([], status: RxStatus.empty());
  //       //   } else {
  //       //     change(dashboardList.value, status: RxStatus.success());
  //       //   }
  //       // } else {
  //       //   String errorMessage =
  //       //       "${productModel.statusCode} ${productModel.status}";
  //       //   change(null, status: RxStatus.error(errorMessage));
  //       // }
  //       update();
  //     },
  //     onError: (error) {
  //       change(null, status: RxStatus.error(error));
  //       print(error);
  //     },
  //   );
  //   isLoading.value = false;
  //   print("STATUS OF LOADING ${isLoading.value}");
  //   update();
  // }


}
