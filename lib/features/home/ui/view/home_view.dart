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
        return state.status == AbsenceStateStatus.initial
            ? const Center(child: CircularProgressIndicator())
            : state.status == AbsenceStateStatus.failure && state.absences.isEmpty
                ? const Center(child: Text("Failed to fetch absences. Please try again."))
                : ListView.separated(
                    padding: const EdgeInsets.all(16),
                    controller: _scrollController,
                    itemBuilder: (context, index) {
                      if (index >= state.absences.length) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return AbsenceItem(absence: state.absences[index]);
                    },
                    separatorBuilder: (context, index) => const SizedBox(height: 16),
                    itemCount: state.hasReachedMax ? state.absences.length : state.absences.length + 1,
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
