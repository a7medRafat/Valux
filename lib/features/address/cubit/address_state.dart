part of 'address_cubit.dart';

@immutable
abstract class AddressState {}

class AddressInitial extends AddressState {}

class GetLocationLoadingState extends AddressState {}

class GetLocationSuccessState extends AddressState {
  final double? long;
  final double? lat;

  GetLocationSuccessState({required this.long, required this.lat});
}

class GetLocationErrorState extends AddressState {
  final String error;

  GetLocationErrorState({required this.error});
}

class AddAddressLoadingState extends AddressState {}

class AddAddressSuccessState extends AddressState {
  final AddressModel model;

  AddAddressSuccessState({required this.model});
}

class AddAddressErrorState extends AddressState {
  final String error;

  AddAddressErrorState({required this.error});
}

class GetAddressLoadingState extends AddressState {}

class GetAddressSuccessState extends AddressState {
  final GetAddresses model;

  GetAddressSuccessState({required this.model});
}

class GetAddressErrorState extends AddressState {
  final String error;

  GetAddressErrorState({required this.error});
}

class GetSelectedAddressState extends AddressState {}

class SetZoomSuccessState extends AddressState {}
