import 'package:absence_mananger/common/constants/dimens.dart';
import 'package:absence_mananger/common/constants/spacing.dart';
import 'package:absence_mananger/features/home/bloc/bloc/absence_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'date_filter_view.dart';
import 'filter_view_header.dart';
import 'type_filter_view.dart';

class FilterView extends StatelessWidget {
  const FilterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(Dimens.margin, Dimens.margin, Dimens.margin, Dimens.marginLarge),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FilterViewHeader(),
          Spacing.vertical,
          const TypeFilterView(),
          Spacing.vertical,
          const DateFilterView(),
          Spacing.vLarge,
          Center(
            child: ElevatedButton(
              onPressed: () {
                context.read<AbsenceBloc>().add(AbsenceFilterReset());
                Navigator.pop(context);
              },
              child: const Text('Clear Filters'),
            ),
          ),
        ],
      ),
    );
  }
}
