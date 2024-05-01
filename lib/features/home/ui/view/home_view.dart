import 'package:absence_mananger/features/home/bloc/bloc/absence_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AbsenceBloc, AbsenceState>(
      builder: (context, state) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(state.absences[index].member.name),
              subtitle: Text(state.absences[index].startDate.toString()),
            );
          },
          itemCount: state.absences.length,
        );
      },
    );
  }
}
