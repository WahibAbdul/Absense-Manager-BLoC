import 'package:absence_mananger/common/api/absence_api.dart';
import 'package:absence_mananger/common/models/absence.dart';

class AbsenceRepository {
  final AbsenceApi _absenceApi;

  const AbsenceRepository(this._absenceApi);

  Future<List<Absence>> getAbsences({
    int limit = 10,
    int offset = 0,
  }) async {
    final list = await _absenceApi.getAbsences(limit: limit, offset: offset);
    final result = list.map((e) => Absence.fromJson(e as Map<String, dynamic>)).toList();
    return result;
  }
}
