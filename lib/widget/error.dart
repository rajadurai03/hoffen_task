
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hoffensoft_task/utils/colors_utils.dart';
import 'package:hoffensoft_task/utils/methods_utils.dart';

import '../utils/constant_utils.dart';



class ErrorMessage extends StatelessWidget {

  String? image,title,message;
 ErrorMessage({this.image,this.title,this.message}) ;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
mainAxisAlignment: MainAxisAlignment.center,
children: [
      logo(context, image!),
      const SizedBox(height: axisSpacing,),
      titleData(context,title!),
      const SizedBox(height: axisSpacing /3,),
      messageData(context,message!)







    ],);
  }
}

Widget logo(BuildContext context,String image) {
  return Container(
    width: double.infinity,
    padding: padding16,
    child:Align(alignment:Alignment.center,child: SvgPicture.asset(image,width: kToolbarHeight * 2,height: kToolbarHeight * 2,),
  ),);
}

Widget titleData(BuildContext context, String? title) {
  return Text(
    title!,
    style: Theme.of(context).textTheme.headline6!,
  );
}


Widget messageData(BuildContext context, String? title) {
  return Text(
    title!,textAlign: TextAlign.center,
    style: Theme.of(context).textTheme.caption?.merge(TextStyle(color: HexColor(orangeColor)))
  );
}
