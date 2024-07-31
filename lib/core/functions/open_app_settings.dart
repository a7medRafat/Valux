import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:valux/config/Strings/app_strings.dart';
import 'package:valux/config/style/app_fonts.dart';
import 'package:valux/core/utils/vContainer.dart';

void navigateToSettings(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        title: Text('Permissions Required', style: AppFonts.headline2),
        content: Text(AppStrings.locationPermanentlyDenied),
        actions: <Widget>[
          TextButton(
            child: Text(
              'Open Settings',
              style: AppFonts.bodyText1.copyWith(color: Colors.blue),
            ),
            onPressed: () {
              Geolocator.openAppSettings();
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text(
              'Cancel',
              style: AppFonts.bodyText1.copyWith(color: Colors.grey),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
