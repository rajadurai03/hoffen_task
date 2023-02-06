import '../controllers/internet_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class InternetStatus extends StatelessWidget {
  final internetController = Get.put(InternetController());
  bool connectionStatus = false;
  @override
  Widget build(BuildContext context) {
    return   Obx(()=> internetController.connectionStatus.value ==connectionStatus ? Container(
      height: kToolbarHeight /2 ,
      color:  Colors.redAccent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         const Icon(Icons.network_check_rounded,color: Colors.white,size: 24,),
          const SizedBox(width: 10,),
         Flexible(child:  Text("Check Your Internet Connection .",maxLines:2,  overflow: TextOverflow.ellipsis
             ,style:Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.white,fontWeight: FontWeight.bold)))
        ],),
    ) : const SizedBox()
    );
  }
}