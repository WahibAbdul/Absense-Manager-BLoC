part of 'absence_bloc.dart';

enum AbsenceStateStatus { initial, success, failure }

final class AbsenceState extends Equatable {
  const AbsenceState({
    this.status = AbsenceStateStatus.initial,
    this.absences = const <Absence>[],
    this.hasReachedMax = false,
  });

  final AbsenceStateStatus status;
  final List<Absence> absences;
  final bool hasReachedMax;

  AbsenceState copyWith({
    AbsenceStateStatus? status,
    List<Absence>? absences,
    bool? hasReachedMax,
  }) {
    return AbsenceState(
      status: status ?? this.status,
      absences: absences ?? this.absences,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [
        status,
        absences,
        hasReachedMax,
      ];
}
