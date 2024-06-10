import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/features/address/cubit/address_cubit.dart';
import '../../../../core/utils/default_text_field.dart';
import 'MyLocation.dart';

class AddressInputs extends StatelessWidget {
  const AddressInputs({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DefaultField(
              borderRadius: BorderRadius.zero,
              controller: AddressCubit.nameController,
              hint: 'name',
              isPassword: false,
              textInputType: TextInputType.name,
              validation: (value) {
                if (value.isEmpty) {
                  return 'field required';
                }
              }),
          SizedBox(height: 8.h),
          DefaultField(
              isRead: true,
              borderRadius: BorderRadius.zero,
              controller: AddressCubit.cityController,
              hint: 'city',
              isPassword: false,
              textInputType: TextInputType.text,
              validation: (value) {
                if (value.isEmpty) {
                  return 'field required';
                }
              }),
          SizedBox(height: 8.h),
          DefaultField(
              isRead: true,
              borderRadius: BorderRadius.zero,
              controller: AddressCubit.reginController,
              hint: 'region',
              isPassword: false,
              textInputType: TextInputType.text,
              validation: (value) {
                if (value.isEmpty) {
                  return 'field required';
                }
              }),
          SizedBox(height: 8.h),
          DefaultField(
              isRead: true,
              borderRadius: BorderRadius.zero,
              controller: AddressCubit.detailsController,
              hint: 'ex: 7 bank str',
              isPassword: false,
              textInputType: TextInputType.text,
              validation: (value) {
                if (value.isEmpty) {
                  return 'field required';
                }
              }),
          SizedBox(height: 8.h),
          DefaultField(
              borderRadius: BorderRadius.zero,
              controller: AddressCubit.notesController,
              hint: 'home or work address',
              isPassword: false,
              textInputType: TextInputType.text,
              validation: (value) {
                if (value.isEmpty) {
                  return 'field required';
                }
              }),
          SizedBox(height: 8.h),
          MyLocation(
              latitudeController: AddressCubit.latitudeController,
              longitudeController: AddressCubit.longitudeController)
        ],
      ),
    );
  }
}
