part of 'absence_bloc.dart';

sealed class AbsenceEvent extends Equatable {
  const AbsenceEvent();

  @override
  List<Object> get props => [];
}

/// This event is used to fetch the absences from the server
final class AbsenceFetched extends AbsenceEvent {}

/// This event is used to filter the absences by type
final class AbsenceFilterTypeChanged extends AbsenceEvent {
  const AbsenceFilterTypeChanged({
    this.filterType = AbsenceType.none,
  });

  final AbsenceType filterType;

  @override
  List<Object> get props => [filterType];
}

/// This event is used to filter the absences by date
final class AbsenceFilterDateChanged extends AbsenceEvent {
  const AbsenceFilterDateChanged({
    this.filterFromDate,
    this.filterToDate,
  });

  final DateTime? filterFromDate;
  final DateTime? filterToDate;

  @override
  List<Object> get props => [filterFromDate.toString(), filterToDate.toString()];
}

/// This event is used to reset the filters
final class AbsenceFilterReset extends AbsenceEvent {}
