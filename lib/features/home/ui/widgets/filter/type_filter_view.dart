import 'package:absence_mananger/common/constants/dimens.dart';
import 'package:absence_mananger/common/constants/spacing.dart';
import 'package:absence_mananger/common/extensions/string_extension.dart';
import 'package:absence_mananger/common/models/absence.dart';
import 'package:absence_mananger/features/home/bloc/absence_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TypeFilterView extends StatelessWidget {
  const TypeFilterView({super.key});

  @override
  Widget build(BuildContext context) {
    // Using the context.select method to get the filterType from the AbsenceBloc and rebuild the widget when the values change to avoid unnecessary rebuilds.
    final selectedType = context.select((AbsenceBloc bloc) => bloc.state.filterType);

    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Type:',
          style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        Spacing.vMedium,
        Wrap(
          spacing: Dimens.marginMedium,
          children: [
            ChoiceChip(
              label: const Text('All'),
              selected: selectedType == AbsenceType.none,
              onSelected: (value) {
                context.read<AbsenceBloc>().add(const AbsenceFilterTypeChanged(filterType: AbsenceType.none));
              },
            ),
            for (final type in AbsenceType.filterTypes)
              ChoiceChip(
                label: Text(type.name.capitalized()),
                selected: selectedType == type,
                onSelected: (value) {
                  context.read<AbsenceBloc>().add(AbsenceFilterTypeChanged(filterType: type));
                },
              )
          ],
        ),
      ],
    );
  }
}
