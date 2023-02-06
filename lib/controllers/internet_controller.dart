import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
/*date: 08-05-2021
* dev: Durai
* task: InternetController created*/
class InternetController extends GetxController {
  var connectionStatus = true.obs;

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription< ConnectivityResult > _connectivitySubscription;


  @override
  void onInit() {
    super.onInit();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_UpdateConnectionState);
  }


  Future< void > initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print("Error Occurred: ${e.toString()} ");
      return;
    }

    return _UpdateConnectionState(result);
  }


  Future<void> _UpdateConnectionState(ConnectivityResult result) async {
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      connectionStatus.value = true;
    } else {
      connectionStatus.value = false;
    }
    update();
  }


  @override
  void onClose() {
    _connectivitySubscription.cancel();
  }

}

