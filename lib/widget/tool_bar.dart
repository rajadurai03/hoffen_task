
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hoffensoft_task/utils/methods_utils.dart';
import '/utils/colors_utils.dart';
import '/utils/constant_utils.dart';
import '/utils/pref_manager.dart';
import 'package:get/get.dart';

class Toolbar extends StatelessWidget implements PreferredSizeWidget {
   String? title;
   final String? leftsideIcon, rightsideIcon;
  late VoidCallback?  leftsideBtnPress,rightsideBtnPress;
   int?  rightsideBtnAvil;
  final AppBar? appBar;
  Color? rightIconColor;
  List<Widget>? rightSideWidgets;

  Toolbar(
      {Key? key, this.title,
      this.leftsideIcon,
      this.rightsideIcon,
      this.leftsideBtnPress,this.rightSideWidgets,
      this.rightsideBtnPress,
      this.rightsideBtnAvil,this.rightIconColor,this.appBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      centerTitle: true,
      elevation: 0.0,
      iconTheme: IconThemeData(color: context.theme.hintColor),
      title: Text(
        title!,
        textAlign: TextAlign.center,
        style: context.textTheme.headline6!.copyWith(color: HexColor(orangeColor),fontWeight: FontWeight.bold),
      ),
      leading: IconButton(
        onPressed: leftsideBtnPress,
        icon: Image.asset(
          leftsideIcon!,
          width: kToolbarHeight - 24,
          height: kToolbarHeight - 24,
        ),
      ),
      actions: rightSideWidgets
    );
  }


  @override
  Size get preferredSize => const Size.fromHeight(56);

}

