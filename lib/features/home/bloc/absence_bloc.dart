import 'package:absence_mananger/common/models/absence.dart';
import 'package:absence_mananger/common/repositories/absence_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:stream_transform/stream_transform.dart';

part 'absence_event.dart';
part 'absence_state.dart';

const throttleDuration = Duration(milliseconds: 100);

// A transformer that throttles the events and drops the ones that are emitted while the previous event is still being processed.
EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class AbsenceBloc extends Bloc<AbsenceEvent, AbsenceState> {
  AbsenceBloc(this._repository) : super(const AbsenceState()) {
    on<AbsenceEvent>(
      (event, emit) {
        if (event is AbsenceFetched) {
          return _onAbsencesFetched(event, emit);
        } else if (event is AbsenceFilterTypeChanged) {
          return _onAbsencesTypeFiltered(event, emit);
        } else if (event is AbsenceFilterDateChanged) {
          return _onAbsencesDateFiltered(event, emit);
        } else if (event is AbsenceFilterReset) {
          _onAbsencesFilterReset(event, emit);
        }
      },
      transformer: throttleDroppable(throttleDuration),
    );
  }

  final AbsenceRepository _repository;

  // This method is used to fetch the absences from the server
  Future<void> _onAbsencesFetched(AbsenceEvent event, Emitter<AbsenceState> emit) async {
    if (state.hasReachedMax) return Future.value();
    try {
      if (state.status == AbsenceStateStatus.initial) {
        final data = await _repository.getAbsences();
        return emit(state.copyWith(
          status: AbsenceStateStatus.success,
          absences: data.$1,
          totalAbsences: data.$2,
          hasReachedMax: data.$1.isEmpty,
        ));
      }
      final data = await _repository.getAbsences(offset: state.absences.length);
      emit(
        data.$1.isEmpty
            ? state.copyWith(hasReachedMax: true)
            : state.copyWith(
                status: AbsenceStateStatus.success,
                absences: List.of(state.absences)..addAll(data.$1),
                hasReachedMax: false,
                filteredAbsences: _applyFilter(
                  state.filterType,
                  fromDate: state.filterFromDate,
                  toDate: state.filterToDate,
                ),
              ),
      );
    } catch (e) {
      emit(state.copyWith(status: AbsenceStateStatus.failure));
    }
  }

  // This method is used to filter the absences by type
  Future<void> _onAbsencesTypeFiltered(AbsenceFilterTypeChanged event, Emitter<AbsenceState> emit) async {
    emit(state.copyWith(
      filterType: event.filterType,
      filteredAbsences: _applyFilter(
        event.filterType,
        fromDate: state.filterFromDate,
        toDate: state.filterToDate,
      ),
    ));
  }

  // This method is used to filter the absences by date
  Future<void> _onAbsencesDateFiltered(AbsenceFilterDateChanged event, Emitter<AbsenceState> emit) async {
    emit(state.copyWith(
      filterFromDate: event.filterFromDate,
      filterToDate: event.filterToDate,
      filteredAbsences: _applyFilter(
        state.filterType,
        fromDate: event.filterFromDate,
        toDate: event.filterToDate,
      ),
    ));
  }

  // This method is used to reset the filters
  Future<void> _onAbsencesFilterReset(AbsenceFilterReset event, Emitter<AbsenceState> emit) async {
    emit(state.resetFilters());
  }

  // This method is used to apply the filters
  List<Absence> _applyFilter(AbsenceType type, {DateTime? fromDate, DateTime? toDate}) {
    List<Absence> filtered = List.from(state.absences);

    if (type != AbsenceType.none) {
      filtered = state.absences.where((absence) => absence.type == type).toList();
    }

    if (fromDate != null) {
      filtered = filtered
          .where((absence) => absence.startDate == null
              ? false
              : (absence.startDate!.isAfter(fromDate) || absence.startDate!.isAtSameMomentAs(fromDate)))
          .toList();
    }

    if (toDate != null) {
      filtered = filtered
          .where((absence) => absence.endDate == null
              ? false
              : (absence.endDate!.isBefore(toDate) || absence.endDate!.isAtSameMomentAs(toDate)))
          .toList();
    }

    return filtered;
  }
}
