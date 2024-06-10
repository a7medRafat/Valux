import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/features/address/cubit/address_cubit.dart';

import '../../../../../App/injuctoin_container.dart';

class ShoppingAddress extends StatelessWidget {
  const ShoppingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Address'),
            SizedBox(height: 15.h),
            Text(sl<AddressCubit>().selectedAddress!.city!),
            Text(sl<AddressCubit>().selectedAddress!.region!),
            Text(sl<AddressCubit>().selectedAddress!.details!),
          ],
        );
      },
    );
  }
}
