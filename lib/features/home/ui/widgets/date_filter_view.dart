import 'package:absence_mananger/common/utils/date_utils.dart';
import 'package:absence_mananger/features/home/bloc/bloc/absence_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DateFilterView extends StatelessWidget {
  const DateFilterView({super.key});

  @override
  Widget build(BuildContext context) {
    final fromDate = context.select((AbsenceBloc bloc) => bloc.state.filterFromDate);
    final toDate = context.select((AbsenceBloc bloc) => bloc.state.filterToDate);
    final text = fromDate != null && toDate != null
        ? '${DateUtil.getFormattedDate(fromDate, 'dd/MM/yyyy')} - ${DateUtil.getFormattedDate(toDate, 'dd/MM/yyyy')}'
        : 'Select Date Range';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton.icon(
          icon: const Icon(Icons.date_range),
          label: Text(text),
          onPressed: () async {
            final date = await showDateRangePicker(
              context: context,
              firstDate: DateTime(DateTime.now().year - 5, 01, 01),
              lastDate: DateTime(DateTime.now().year + 1, 12, 31),
              currentDate: DateTime(2021, 01, 01),
              initialDateRange: fromDate != null && toDate != null ? DateTimeRange(start: fromDate, end: toDate) : null,
            );
            if (date != null && context.mounted) {
              context.read<AbsenceBloc>().add(
                    AbsenceFilterDateChanged(
                      filterFromDate: date.start,
                      filterToDate: date.end,
                    ),
                  );
            }
          },
        ),
      ],
    );
  }
}
