import 'package:absence_mananger/common/constants/dimens.dart';
import 'package:absence_mananger/common/constants/spacing.dart';
import 'package:absence_mananger/common/extensions/string_extension.dart';
import 'package:absence_mananger/common/models/absence.dart';
import 'package:absence_mananger/features/home/bloc/bloc/absence_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TypeFilterView extends StatelessWidget {
  const TypeFilterView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Type:',
          style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        Spacing.vMedium,
        BlocBuilder<AbsenceBloc, AbsenceState>(
          builder: (context, state) {
            return Wrap(
              spacing: Dimens.marginMedium,
              children: [
                ChoiceChip(
                  label: const Text('All'),
                  selected: state.filterType == AbsenceType.none,
                  onSelected: (value) {
                    context.read<AbsenceBloc>().add(const AbsenceFilterTypeChanged(filterType: AbsenceType.none));
                  },
                ),
                for (final type in AbsenceType.filterTypes)
                  ChoiceChip(
                    label: Text(type.name.capitalized()),
                    selected: state.filterType == type,
                    onSelected: (value) {
                      context.read<AbsenceBloc>().add(AbsenceFilterTypeChanged(filterType: type));
                    },
                  )
              ],
            );
          },
        )
      ],
    );
  }
}
