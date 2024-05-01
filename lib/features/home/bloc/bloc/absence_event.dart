part of 'absence_bloc.dart';

sealed class AbsenceEvent extends Equatable {
  const AbsenceEvent();

  @override
  List<Object> get props => [];
}

final class AbsenceFetched extends AbsenceEvent {}

final class AbsenceFilterTypeChanged extends AbsenceEvent {
  const AbsenceFilterTypeChanged({
    this.filterType = AbsenceType.none,
  });

  final AbsenceType filterType;

  @override
  List<Object> get props => [filterType];
}

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

final class AbsenceFilterReset extends AbsenceEvent {}
