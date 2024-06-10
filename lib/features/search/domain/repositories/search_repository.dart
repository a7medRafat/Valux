import 'package:dartz/dartz.dart';
import 'package:valux/features/search/data/models/SearchModel.dart';
import '../../../../core/error_handeller/failures.dart';

abstract class SearchRepository {
  Future<Either<Failure, SearchModel>> search({required String text});
}
