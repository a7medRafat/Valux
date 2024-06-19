import 'package:dartz/dartz.dart';
import 'package:valux/core/error_handeller/failures.dart';

import '../../data/models/GetAddresses.dart';

abstract class AddressRepository {
  Future<Either<Failure, GetAddresses>> getAddresses();
}
