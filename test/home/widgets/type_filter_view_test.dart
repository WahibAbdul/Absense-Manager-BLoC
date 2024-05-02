import 'package:absence_mananger/common/extensions/string_extension.dart';
import 'package:absence_mananger/features/home/ui/widgets/filter/type_filter_view.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:absence_mananger/features/home/bloc/absence_bloc.dart';
import 'package:absence_mananger/common/models/absence.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';

class MockAbsenceBloc extends MockBloc<AbsenceEvent, AbsenceState> implements AbsenceBloc {}

void main() {
  late AbsenceBloc absenceBloc;

  setUpAll(() {
    registerFallbackValue(AbsenceFetched());
    registerFallbackValue(const AbsenceState());
  });

  setUp(() {
    absenceBloc = MockAbsenceBloc();
  });

  testWidgets('renders correctly for each absence type', (WidgetTester tester) async {
    when(() => absenceBloc.state).thenReturn(const AbsenceState(filterType: AbsenceType.none));

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BlocProvider.value(
            value: absenceBloc,
            child: const TypeFilterView(),
          ),
        ),
      ),
    );

    expect(find.text('All'), findsOneWidget);
    for (final type in AbsenceType.filterTypes) {
      expect(find.text(type.name.capitalized()), findsOneWidget);
    }
  });
}
