import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valux/core/utils/loading.dart';
import 'package:valux/features/address/cubit/address_cubit.dart';

class ZoomInOut extends StatelessWidget {
  const ZoomInOut({super.key,
    required this.getLocation,
    required this.zoomIn,
    required this.zoomOut});

  final Function() getLocation;
  final Function() zoomIn;
  final Function() zoomOut;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            BlocBuilder<AddressCubit, AddressState>(
              builder: (context, state) {
                if(state is GetLocationLoadingState){
                  return const SizedBox(
                      child: Loading());
                }
                return FloatingActionButton(
                  heroTag:"btn1",
                  backgroundColor: Colors.black45,
                  mini: true,
                  onPressed: getLocation,
                  child: const Icon(Icons.my_location, color: Colors.blue),
                );
              },
            ),
            const SizedBox(height: 3),
            FloatingActionButton(
              heroTag: "btn2",
              backgroundColor: Colors.black45,
              mini: true,
              onPressed: zoomIn,
              child: const Icon(Icons.remove, color: Colors.white),
            ),
            const SizedBox(height: 3),
            FloatingActionButton(
              heroTag: "btn3",
              backgroundColor: Colors.black45,
              mini: true,
              onPressed: zoomOut,
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
