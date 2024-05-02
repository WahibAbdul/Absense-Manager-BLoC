import 'package:absence_mananger/features/home/bloc/bloc/absence_bloc.dart';
import 'package:absence_mananger/features/home/ui/widgets/absences_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AbsenceBloc, AbsenceState>(
      builder: (context, state) {
        final absencesList = state.isFiltersEnabled ? state.filteredAbsences : state.absences;
        return state.status == AbsenceStateStatus.initial
            ? const Center(child: CircularProgressIndicator())
            : absencesList.isEmpty
                ? Center(
                    child: Text(state.status == AbsenceStateStatus.failure
                        ? "Failed to fetch absences. Please try again."
                        : "No absences found."))
                : AbsencesList(
                    absences: absencesList,
                    canLoadMore: state.isFiltersEnabled ? false : !state.hasReachedMax,
                  );
      },
    );
  }
}
