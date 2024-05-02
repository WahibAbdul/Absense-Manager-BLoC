import 'package:absence_mananger/common/api/absence_api.dart';
import 'package:absence_mananger/common/models/absence.dart';

class AbsenceRepository {
  final AbsenceApi _absenceApi;

  const AbsenceRepository(this._absenceApi);

  /// Fetches a list of absences from the API.
  ///
  /// This method sends a GET request to the Absence API and returns a tuple containing a list of `Absence` objects and the total number of absences.
  ///
  /// The `limit` parameter determines the maximum number of absences returned in the list. It defaults to 10 if not provided.
  ///
  /// The `offset` parameter determines the number of absences to skip before starting to return absences. It defaults to 0 if not provided.
  ///
  /// Returns a `Future` that completes with a tuple `(List<Absence> list, int total)`. The `list` is a list of `Absence` objects, and `total` is the total number of absences.
  ///
  /// Throws an `ApiException` if the API request fails.
  Future<(List<Absence> list, int total)> getAbsences({
    int limit = 10,
    int offset = 0,
  }) async {
    final response = await _absenceApi.getAbsences(limit: limit, offset: offset);
    return (response.data, response.total);
  }
}
