import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import 'package:valux/core/Map/zoomInOut.dart';
import 'package:valux/core/functions/app_functions.dart';
import 'package:valux/features/address/cubit/address_cubit.dart';
import '../../App/injuctoin_container.dart';

class MyMap extends StatefulWidget {
  const MyMap({super.key});

  @override
  State<MyMap> createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  LatLng? tappedPoint;

  // void _setZoom(double zoom) {
  //   setState(() {
  //     _zoom = zoom.clamp(1.0, 18.0);
  //     AddressCubit.mapController.move(AddressCubit.mapController.center, _zoom);
  //   });
  // }
  //
  // void getCurrentLocation() async {
  //   await sl<AddressCubit>().getCurrentPosition(context);
  //   // _currentLocation = LatLng(AddressCubit.latitude!, AddressCubit.longitude!);
  //   setState(() {
  //     AddressCubit.mapController.move(AddressCubit.currentLocation!, _zoom);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(
            right: 20,
            top: 10,
          ),
          child: SizedBox(
            height: 200.h,
            width: double.infinity,
            child: FlutterMap(
              mapController: AddressCubit.mapController,
              options: MapOptions(
                minZoom: 15,
                center:
                    AddressCubit.currentLocation ?? const LatLng(51.5, -0.09),
                zoom: sl<AddressCubit>().zoom,
                initialCenter: const LatLng(51.509364, -0.128928),
                onTap: (tapPosition, point) async {
                  final placeMark = await AppFunctions.getAddressFromLatLng(
                      point.latitude, point.longitude);
                  setState(() {
                    tappedPoint = point;
                    AddressCubit.latitudeController.text =
                        point.latitude.toString();
                    AddressCubit.longitudeController.text =
                        point.longitude.toString();
                    AddressCubit.cityController.text =
                        placeMark.administrativeArea!;
                    AddressCubit.reginController.text = placeMark.country!;
                    AddressCubit.detailsController.text = placeMark.street!;
                  });
                },
              ),
              children: [
                TileLayer(
                  maxNativeZoom: 20,
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                ),
                MarkerLayer(
                  markers: [
                    if (tappedPoint != null)
                      Marker(
                        width: 80,
                        height: 80,
                        alignment: Alignment.center,
                        point: tappedPoint!,
                        child: const Icon(Icons.location_pin,
                            color: Colors.redAccent, size: 50),
                      ),
                    if (AddressCubit.currentLocation != null)
                      Marker(
                        width: 80,
                        height: 80,
                        alignment: Alignment.center,
                        point: AddressCubit.currentLocation!,
                        child: const Icon(Icons.location_pin,
                            color: Colors.red, size: 50),
                      ),
                  ],
                ),
                ZoomInOut(
                  getLocation: () =>
                      sl<AddressCubit>().getCurrentPosition(context),
                  zoomIn: () =>
                      sl<AddressCubit>().setZoom(sl<AddressCubit>().zoom - 1),
                  zoomOut: () =>
                      sl<AddressCubit>().setZoom(sl<AddressCubit>().zoom + 1),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
