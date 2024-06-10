import '../../../../core/API/api_services.dart';
import '../models/SearchModel.dart';

abstract class SearchRemoteDataSource {
  Future<SearchModel> search({required String text});
}

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  final ApiService apiService;

  SearchRemoteDataSourceImpl({required this.apiService});

  @override
  Future<SearchModel> search({required String text}) async {
    return await apiService.search(text: text);
  }
}
