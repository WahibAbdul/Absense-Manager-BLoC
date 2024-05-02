import 'package:absence_mananger/common/constants/dimens.dart';
import 'package:absence_mananger/common/models/absence.dart';
import 'package:absence_mananger/features/home/bloc/bloc/absence_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'absence_item.dart';

class AbsencesList extends StatefulWidget {
  const AbsencesList({
    super.key,
    required this.absences,
    this.canLoadMore = true,
  });
  final List<Absence> absences;
  final bool canLoadMore;

  @override
  State<AbsencesList> createState() => _AbsencesListState();
}

class _AbsencesListState extends State<AbsencesList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(Dimens.margin),
      controller: _scrollController,
      itemBuilder: (context, index) {
        if (index >= widget.absences.length) {
          return const Center(child: CircularProgressIndicator());
        }
        return AbsenceItem(absence: widget.absences[index]);
      },
      separatorBuilder: (context, index) => const SizedBox(height: Dimens.margin),
      itemCount: widget.canLoadMore ? widget.absences.length + 1 : widget.absences.length,
    );
  }

  void _onScroll() {
    if (_isBottom && widget.canLoadMore) {
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
