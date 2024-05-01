import 'package:absence_mananger/common/constants/dimens.dart';
import 'package:absence_mananger/features/home/bloc/bloc/absence_bloc.dart';
import 'package:absence_mananger/features/home/ui/widgets/absence_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

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
                : ListView.separated(
                    padding: const EdgeInsets.all(Dimens.margin),
                    controller: _scrollController,
                    itemBuilder: (context, index) {
                      if (index >= state.absences.length) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return AbsenceItem(absence: absencesList[index]);
                    },
                    separatorBuilder: (context, index) => const SizedBox(height: Dimens.margin),
                    itemCount:
                        state.isFiltersEnabled || state.hasReachedMax ? absencesList.length : absencesList.length + 1,
                  );
      },
    );
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<AbsenceBloc>().add(AbsenceFetched());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
