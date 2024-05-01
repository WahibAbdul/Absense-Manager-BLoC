import 'package:absence_mananger/common/networking/api_service.dart';

class AbsenceApi {
  final ApiService _apiService;

  const AbsenceApi(this._apiService);

  Future<List<dynamic>> getAbsences({
    int? limit,
    int? offset,
  }) async {
    final queryParameters = <String, String>{};
    if (limit != null) {
      queryParameters['limit'] = limit.toString();
    }
    if (offset != null) {
      queryParameters['offset'] = offset.toString();
    }
    final response = await _apiService.get(
      '/getAbsences',
      queryParameters: queryParameters,
    );
    return (response['data'] as List);
  }
}
