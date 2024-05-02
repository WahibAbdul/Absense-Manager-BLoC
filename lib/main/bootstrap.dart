import 'package:absence_mananger/common/api/absence_api.dart';
import 'package:absence_mananger/common/constants/constants.dart';
import 'package:absence_mananger/common/networking/api_service.dart';
import 'package:absence_mananger/common/repositories/absence_repository.dart';
import 'package:absence_mananger/features/home/bloc/absence_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void bootstrap(Widget app) {
  // We can perform all the necessary setup here like Firebase, Error Logging, toggle dev & production env etc.
  runApp(
    // Intializing Provider for AbsenceRepository because AbsenceBloc is dependent on AbsenceRepository
    RepositoryProvider(
      create: (context) {
        final apiService = ApiService(Constants.baseUrl);
        return AbsenceRepository(AbsenceApi(apiService));
      },
      // Intializing Provider for AbsenceBloc because our complete app is dependent on AbsenceBloc & fetching intial data
      child: BlocProvider(
        create: (context) => AbsenceBloc(context.read<AbsenceRepository>())..add(AbsenceFetched()),
        child: app,
      ),
    ),
  );
}
