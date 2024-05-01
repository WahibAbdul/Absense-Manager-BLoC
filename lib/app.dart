import 'package:absence_mananger/common/api/absence_api.dart';
import 'package:absence_mananger/common/constants/constants.dart';

import 'package:absence_mananger/common/networking/api_service.dart';
import 'package:absence_mananger/common/repositories/absence_repository.dart';
import 'package:absence_mananger/features/home/bloc/bloc/absence_bloc.dart';
import 'package:absence_mananger/features/home/ui/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final ApiService apiService;

  @override
  void initState() {
    super.initState();
    apiService = ApiService(Constants.baseUrl);
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) {
        return AbsenceRepository(AbsenceApi(apiService));
      },
      child: BlocProvider(
        create: (context) => AbsenceBloc(context.read<AbsenceRepository>())..add(AbsenceFetched()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Absence Manager',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepOrange,
            ),
            useMaterial3: true,
          ),
          home: const HomePage(),
        ),
      ),
    );
  }
}
