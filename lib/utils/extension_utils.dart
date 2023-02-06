import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'colors_utils.dart';
import 'colors_utils.dart';

extension EmailValidExtension on String{
  bool isValidEmail(){
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this);
  }
}

//Example
//String email = "abc@gmail.com";
//print(email.isValidEmail());

extension CirleImgExtension on String{
  circleImage(){
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 60,
      backgroundImage: NetworkImage(this),
    );
  }
}

/**Example for CirleImgExtension **/
/*
final imageUrl = "https://image.shutterstock.com/image-vector/panoramic-countryside-landscape-autumn-fallen-260nw-1174405507.jpg";
Center(
child: imageUrl.circleImage(),
);*/
