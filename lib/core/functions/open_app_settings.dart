import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:valux/config/Strings/app_strings.dart';
import 'package:valux/core/utils/vContainer.dart';

void navigateToSettings(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return VContainer(
        color: Colors.white,
        child: AlertDialog(
          title: const Text('Permissions Required'),
          content: Text(AppStrings.locationPermanentlyDenied),
          actions: <Widget>[
            TextButton(
              child: const Text('Open Settings'),
              onPressed: () {
                Geolocator.openAppSettings();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    },
  );
}
