import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:meta/meta.dart';
import 'package:valux/core/dio_helper/dio_helper.dart';
import 'package:valux/core/API/end_points.dart';
import 'package:valux/core/functions/app_functions.dart';
import 'package:valux/core/local_storage/hive_keys.dart';
import 'package:valux/core/local_storage/user_storage.dart';
import 'package:valux/features/address/data/models/AddressModel.dart';
import 'package:valux/features/address/data/models/Address_body.dart';
import '../data/models/GetAddresses.dart';
import '../domain/usecases/get_addresses_usecase.dart';
part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  final GetAddressesUseCase getAddressesUseCase;

  AddressCubit({required this.getAddressesUseCase}) : super(AddressInitial());

  static LatLng? currentLocation;
  static MapController mapController = MapController();
  static Placemark? placeMark;
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static TextEditingController nameController = TextEditingController();
  static TextEditingController cityController = TextEditingController();
  static TextEditingController reginController = TextEditingController();
  static TextEditingController detailsController = TextEditingController();
  static TextEditingController notesController = TextEditingController();
  static TextEditingController latitudeController = TextEditingController();
  static TextEditingController longitudeController = TextEditingController();

  int selected = -1;
  double zoom = 15.0;

  void setZoom(double zoom) {
    zoom = zoom.clamp(1.0, 18.0);
    AddressCubit.mapController.move(AddressCubit.mapController.center, zoom);
    emit(SetZoomSuccessState());
  }

  Future<void> getCurrentPosition(context) async {
    emit(GetLocationLoadingState());
    final hasPermission = await AppFunctions.handleLocationPermission(context);
    if (!hasPermission) {
      emit(GetLocationErrorState(error: 'permission denied'));
    }
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      final place = await AppFunctions.getAddressFromLatLng(
          position.latitude, position.longitude);
      currentLocation = LatLng(position.latitude, position.longitude);
      mapController.move(AddressCubit.currentLocation!, zoom);
      latitudeController.text = position.latitude.toString();
      longitudeController.text = position.longitude.toString();
      cityController.text = place.country!;
      reginController.text = place.locality!;
      detailsController.text = place.street!;
      emit(GetLocationSuccessState(
          long: position.latitude, lat: position.longitude));
    }).catchError((e) {
      debugPrint(e);
      emit(GetLocationErrorState(error: e));
    });
  }

  AddressModel? addAddressModel;

  void addAddress({required AddressBody body}) async {
    emit(AddAddressLoadingState());
    final response = await DioHelper.postData(
        token: UserData().getData(id: Keys.user)!.token,
        url: EndPoints.ADDRESS,
        data: body.toJson());
    if (response.statusCode == 200) {
      addAddressModel = AddressModel.fromJson(response.data);
      emit(AddAddressSuccessState(model: addAddressModel!));
    } else {
      throw Exception();
    }
  }

  GetAddresses? addressModel;
  AddressData? selectedAddress;

  void getAddress() async {
    emit(GetAddressLoadingState());
    final failureOrSuccess = await getAddressesUseCase.call();
    failureOrSuccess.fold((failure) {
      emit(GetAddressErrorState(error: failure.getMessage()));
    }, (success) {
      addressModel = success;
      emit(GetAddressSuccessState(model: success));
    });
  }

  void getSelectedAddress() {
    selectedAddress = addressModel!.data!.data![selected];
    emit(GetSelectedAddressState());
  }
}
