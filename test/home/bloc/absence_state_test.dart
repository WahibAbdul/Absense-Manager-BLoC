import 'package:absence_mananger/common/models/absence.dart';
import 'package:absence_mananger/features/home/bloc/absence_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AbsenceState', () {
    const initialAbsenceState = AbsenceState();

    test('supports value comparisons', () {
      expect(initialAbsenceState, initialAbsenceState);
    });

    test('returns same object when copying with no changes', () {
      expect(initialAbsenceState.copyWith(), initialAbsenceState);
    });

    test('returns object with updated values when copying with changes', () {
      const updatedAbsenceState = AbsenceState(status: AbsenceStateStatus.success);
      expect(initialAbsenceState.copyWith(status: AbsenceStateStatus.success), updatedAbsenceState);
    });

    test('resets filters correctly', () {
      const filteredAbsenceState = AbsenceState(
        filterType: AbsenceType.none,
        filterFromDate: null,
        filterToDate: null,
        filteredAbsences: [],
      );
      expect(filteredAbsenceState.resetFilters(), initialAbsenceState);
    });

    test('correctly identifies when filters are enabled', () {
      expect(initialAbsenceState.isFiltersEnabled, false);
      const filteredAbsenceState = AbsenceState(filterType: AbsenceType.sickness);
      expect(filteredAbsenceState.isFiltersEnabled, true);
    });

    test('returns object with updated values when copying with multiple changes', () {
      final updatedAbsenceState = AbsenceState(
        status: AbsenceStateStatus.success,
        filterType: AbsenceType.sickness,
        filterFromDate: DateTime(2022, 1, 1),
        filterToDate: DateTime(2022, 12, 31),
        filteredAbsences: const [],
      );
      expect(
        initialAbsenceState.copyWith(
          status: AbsenceStateStatus.success,
          filterType: AbsenceType.sickness,
          filterFromDate: DateTime(2022, 1, 1),
          filterToDate: DateTime(2022, 12, 31),
          filteredAbsences: [],
        ),
        updatedAbsenceState,
      );
    });

    test('correctly identifies when filters are enabled with different combinations', () {
      expect(const AbsenceState(filterType: AbsenceType.sickness).isFiltersEnabled, true);
      expect(AbsenceState(filterFromDate: DateTime(2022, 1, 1)).isFiltersEnabled, true);
      expect(AbsenceState(filterToDate: DateTime(2022, 12, 31)).isFiltersEnabled, true);
      expect(
          AbsenceState(filterType: AbsenceType.vacation, filterFromDate: DateTime(2022, 1, 1)).isFiltersEnabled, true);
      expect(
          AbsenceState(filterType: AbsenceType.vacation, filterToDate: DateTime(2022, 12, 31)).isFiltersEnabled, true);
      expect(AbsenceState(filterFromDate: DateTime(2022, 1, 1), filterToDate: DateTime(2022, 12, 31)).isFiltersEnabled,
          true);
      expect(
          AbsenceState(
                  filterType: AbsenceType.sickness,
                  filterFromDate: DateTime(2022, 1, 1),
                  filterToDate: DateTime(2022, 12, 31))
              .isFiltersEnabled,
          true);
    });
  });
}
