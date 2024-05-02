import 'package:absence_mananger/features/home/bloc/absence_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AbsenceTotalCountView extends StatelessWidget {
  const AbsenceTotalCountView({
    super.key,
    required this.placeholder,
  });
  final String placeholder;

  @override
  Widget build(BuildContext context) {
    // Using the context.select method to get the totalAbsences from the AbsenceBloc and rebuild the widget when the values change to avoid unnecessary rebuilds.
    final totalAbsences = context.select((AbsenceBloc bloc) => bloc.state.totalAbsences);
    return Text(
      totalAbsences == 0 ? placeholder : 'Total: $totalAbsences',
    );
  }
}
