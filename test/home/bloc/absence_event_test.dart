import 'package:absence_mananger/common/models/absence.dart';
import 'package:absence_mananger/features/home/bloc/absence_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AbsenceEvent', () {
    test('AbsenceFetched supports value comparisons', () {
      expect(AbsenceFetched(), AbsenceFetched());
    });

    test('AbsenceFilterTypeChanged supports value comparisons', () {
      expect(const AbsenceFilterTypeChanged(filterType: AbsenceType.sickness),
          const AbsenceFilterTypeChanged(filterType: AbsenceType.sickness));
      expect(const AbsenceFilterTypeChanged(filterType: AbsenceType.sickness),
          isNot(const AbsenceFilterTypeChanged(filterType: AbsenceType.vacation)));
    });

    test('AbsenceFilterDateChanged supports value comparisons', () {
      expect(
        AbsenceFilterDateChanged(filterFromDate: DateTime(2022, 1, 1), filterToDate: DateTime(2022, 12, 31)),
        AbsenceFilterDateChanged(filterFromDate: DateTime(2022, 1, 1), filterToDate: DateTime(2022, 12, 31)),
      );
      expect(
        AbsenceFilterDateChanged(filterFromDate: DateTime(2022, 1, 1), filterToDate: DateTime(2022, 12, 31)),
        isNot(AbsenceFilterDateChanged(filterFromDate: DateTime(2022, 1, 2), filterToDate: DateTime(2022, 12, 31))),
      );
    });

    test('AbsenceFilterReset supports value comparisons', () {
      expect(AbsenceFilterReset(), AbsenceFilterReset());
    });
  });
}
