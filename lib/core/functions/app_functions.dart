import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:valux/core/utils/toast.dart';

import '../utils/placeholder.dart';

class AppFunctions {
  static Future<bool> handleLocationPermission(context) async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      MyToast.show(
          text: 'Location services are disabled. Please enable the services',
          context: context);
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        MyToast.show(text: 'Location permissions are denied', context: context);
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      MyToast.show(
          text:
              'Location permissions are permanently denied, we cannot request permissions.',
          context: context);

      return false;
    }
    if (!serviceEnabled) {
      print('not enabled');
    }
    return true;
  }

  static Future<void> getCurrentPosition(context) async {
    final hasPermission = await handleLocationPermission(context);
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      await getAddressFromLatLng(position.latitude , position.longitude);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  static Future<Placemark> getAddressFromLatLng(double  latitude , double longitude) async {
    final List<Placemark> response =
        await placemarkFromCoordinates(latitude, longitude);
    try {
      Placemark place = response[0];

      return place;
    } catch (e) {
      debugPrint(e.toString());
      throw Exception();
    }
  }


  Widget imageHandler({required String img, double? width, double? height}) {
    try {
      return Image.network(
        width: width,
        height: height,
        img,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return const ImgPlaceHolder();
          }
          return CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                loadingProgress.expectedTotalBytes!
                : null,
          );
        },
      );
    } catch (e) {
      print('Error loading image: $e');
      return const ImgPlaceHolder(); // Display a placeholder image or error message
    }
  }
}
