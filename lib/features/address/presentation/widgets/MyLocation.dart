import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/features/address/cubit/address_cubit.dart';
import '../../../../core/utils/default_text_field.dart';

class MyLocation extends StatelessWidget {
  const MyLocation({
    super.key,
    required this.latitudeController,
    required this.longitudeController,
  });

  final TextEditingController latitudeController;
  final TextEditingController longitudeController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              flex: 2,
              child: DefaultField(
                  isRead: true,
                  borderRadius: BorderRadius.zero,
                  controller: latitudeController,
                  hint: 'latitude',
                  isPassword: false,
                  textInputType: TextInputType.number,
                  validation: (value) {
                    if (value.isEmpty) {
                      return 'field required';
                    }
                  }),
            ),
            SizedBox(width: 5.h),
            Expanded(
              flex: 2,
              child: DefaultField(
                  isRead: true,
                  borderRadius: BorderRadius.zero,
                  controller: longitudeController,
                  hint: 'longitude',
                  isPassword: false,
                  textInputType: TextInputType.number,
                  validation: (value) {
                    if (value.isEmpty) {
                      return 'field required';
                    }
                  }),
            ),
          ],
        );
      },
    );
  }
}
