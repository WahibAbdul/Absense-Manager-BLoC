import 'package:absence_mananger/common/models/absence.dart';
import 'package:absence_mananger/common/repositories/absence_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:stream_transform/stream_transform.dart';

part 'absence_event.dart';
part 'absence_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class AbsenceBloc extends Bloc<AbsenceEvent, AbsenceState> {
  AbsenceBloc(this._repository) : super(const AbsenceState()) {
    on<AbsenceEvent>(
      _onAbsencesFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  final AbsenceRepository _repository;

  Future<void> _onAbsencesFetched(AbsenceEvent event, Emitter<AbsenceState> emit) async {
    if (state.hasReachedMax) return Future.value();
    try {
      if (state.status == AbsenceStateStatus.initial) {
        final absences = await _repository.getAbsences();
        return emit(state.copyWith(
          status: AbsenceStateStatus.success,
          absences: absences,
          hasReachedMax: false,
        ));
      }
      final absences = await _repository.getAbsences(offset: state.absences.length);
      emit(absences.isEmpty
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
              status: AbsenceStateStatus.success,
              absences: List.of(state.absences)..addAll(absences),
              hasReachedMax: false,
            ));
    } catch (e) {
      emit(state.copyWith(status: AbsenceStateStatus.failure));
    }
  }
}
