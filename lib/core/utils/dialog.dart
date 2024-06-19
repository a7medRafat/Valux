import 'package:flutter/material.dart';
import 'package:valux/config/colors/app_colors.dart';
import 'package:valux/config/style/app_fonts.dart';
import 'package:valux/core/utils/vContainer.dart';

class MyDialog {
  static Future<dynamic> show(
          {required context,
          required Function() thisFun,
          required Function() addFun,
          required Widget content}) =>
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          buttonPadding:EdgeInsets.zero,
          backgroundColor: AppColors.vWhite,
          surfaceTintColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(3.0))),
          title: Text("Addresses",
              style: TextStyle(color: AppColors.body, fontSize: 17)),
          content: content,
          actions: <Widget>[
            Row(
              children: [
                VContainer(
                  function: thisFun,
                  padding: const EdgeInsets.all(10),
                  color: AppColors.scaffoldColor,
                  borderRadius: BorderRadius.circular(3),
                  child: Text(
                    "This Address",
                    style:  AppFonts.bodyText3,
                  ),
                ),
                // ignore: prefer_const_constructors
                SizedBox(width: 10),
                VContainer(
                  function: addFun,
                  padding: const EdgeInsets.all(10),
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(3),
                  child: Text(
                    "New Address",
                    style: AppFonts.bodyText3.copyWith(color: AppColors.vWhite),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
