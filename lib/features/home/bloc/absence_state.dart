part of 'absence_bloc.dart';

enum AbsenceStateStatus { initial, success, failure }

@immutable
class AbsenceState extends Equatable {
  const AbsenceState({
    this.status = AbsenceStateStatus.initial,
    this.absences = const <Absence>[],
    this.totalAbsences = 0,
    this.filteredAbsences = const <Absence>[],
    this.hasReachedMax = false,
    this.filterType = AbsenceType.none,
    this.filterFromDate,
    this.filterToDate,
  });

  final AbsenceStateStatus status;
  final List<Absence> absences;
  final int totalAbsences;
  final bool hasReachedMax;
  final AbsenceType filterType;
  final DateTime? filterFromDate;
  final DateTime? filterToDate;
  final List<Absence> filteredAbsences;

  AbsenceState copyWith({
    AbsenceStateStatus? status,
    List<Absence>? absences,
    int? totalAbsences,
    bool? hasReachedMax,
    AbsenceType? filterType,
    DateTime? filterFromDate,
    DateTime? filterToDate,
    List<Absence>? filteredAbsences,
  }) {
    return AbsenceState(
      status: status ?? this.status,
      absences: absences ?? this.absences,
      totalAbsences: totalAbsences ?? this.totalAbsences,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      filterType: filterType ?? this.filterType,
      filterFromDate: filterFromDate ?? this.filterFromDate,
      filterToDate: filterToDate ?? this.filterToDate,
      filteredAbsences: filteredAbsences ?? this.filteredAbsences,
    );
  }

  AbsenceState resetFilters() {
    return AbsenceState(
      status: status,
      absences: absences,
      hasReachedMax: hasReachedMax,
      totalAbsences: totalAbsences,
      filterType: AbsenceType.none,
      filterFromDate: null,
      filterToDate: null,
      filteredAbsences: const [],
    );
  }

  bool get isFiltersEnabled {
    return filterType != AbsenceType.none || filterFromDate != null || filterToDate != null;
  }

  @override
  List<Object?> get props => [
        status,
        absences,
        hasReachedMax,
        filteredAbsences,
        totalAbsences,
        filterType,
        filterFromDate,
        filterToDate,
      ];
}
