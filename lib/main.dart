import 'package:absence_mananger/main/bloc/main_bloc_observer.dart';
import 'package:absence_mananger/main/bootstrap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app.dart';

void main() {
  Bloc.observer = MainBlocObserver();
  bootstrap(const MyApp());
}
