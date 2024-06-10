import 'package:dartz/dartz.dart';
import 'package:valux/features/search/data/models/SearchModel.dart';
import 'package:valux/features/search/domain/repositories/search_repository.dart';
import '../../../../core/error_handeller/failures.dart';

class SearchUseCase {
  final SearchRepository searchRepository;

  SearchUseCase({required this.searchRepository});

  Future<Either<Failure, SearchModel>> call({required String text}) async {
    return await searchRepository.search(text: text);
  }
}
