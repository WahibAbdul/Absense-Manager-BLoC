import 'package:absence_mananger/common/repositories/absence_repository.dart';
import 'package:absence_mananger/features/home/bloc/bloc/absence_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Absence Manager'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: BlocProvider(
        create: (context) => AbsenceBloc(context.read<AbsenceRepository>())..add(AbsenceFetched()),
        child: const HomeView(),
      ),
    );
  }
}
