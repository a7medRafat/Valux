import 'package:dartz/dartz.dart';
import 'package:valux/features/address/data/models/GetAddresses.dart';
import '../../../../core/error_handeller/failures.dart';
import '../repositories/address_repository.dart';

class GetAddressesUseCase {
  final AddressRepository addressRepository;

  GetAddressesUseCase({required this.addressRepository});

  Future<Either<Failure, GetAddresses>> call() async {
    return await addressRepository.getAddresses();
  }
}
