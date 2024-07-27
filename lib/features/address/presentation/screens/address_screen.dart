import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valux/config/style/app_fonts.dart';
import 'package:valux/core/extensions/navigation.dart';
import 'package:valux/core/shared_widgets/app_bar.dart';
import 'package:valux/core/shared_widgets/loading.dart';
import 'package:valux/core/Map/map.dart';
import 'package:valux/core/shared_widgets/toast.dart';
import 'package:valux/features/address/presentation/widgets/address_btn.dart';
import 'package:valux/features/order/presentation/screens/order_screen.dart';
import '../../../../App/injuctoin_container.dart';
import '../../cubit/address_cubit.dart';
import '../../data/models/Address_body.dart';
import '../widgets/address_inputs.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
          leading: TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back, color: Colors.black),
          ),
          title: Text('Address', style: AppFonts.headline2)),
      body: SingleChildScrollView(
        child: Form(
          key: AddressCubit.formKey,
          child: BlocConsumer<AddressCubit, AddressState>(
            listener: (context, state) {
              if (state is AddAddressErrorState) {
                MyToast.show(text: state.error, context: context);
              }
              if (state is AddAddressSuccessState) {
                MyToast.show(text: state.model.message!, context: context);
                context.go(
                    page: const OrderScreen(addressMap: true, selected: -1));
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                  const AddressInputs(),
                  const MyMap(),
                  BlocBuilder<AddressCubit, AddressState>(
                    builder: (context, state) {
                      if (state is AddAddressLoadingState) {
                        return const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Loading(),
                        );
                      }
                      return AddressButton(
                        function: () {
                          if (AddressCubit.formKey.currentState!.validate()) {
                            AddressBody body = AddressBody(
                                name: AddressCubit.nameController.text,
                                city: AddressCubit.cityController.text,
                                region: AddressCubit.reginController.text,
                                details: AddressCubit.detailsController.text,
                                latitude: double.parse(
                                    AddressCubit.longitudeController.text),
                                longitude: double.parse(
                                    AddressCubit.longitudeController.text),
                                notes: AddressCubit.notesController.text);
                            sl<AddressCubit>().addAddress(body: body);
                          }
                        },
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
