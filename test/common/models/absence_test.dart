import 'package:absence_mananger/common/models/absence.dart';
import 'package:absence_mananger/common/models/member.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Absence', () {
    final absence = Absence(
      admitterNote: 'note',
      createdAt: DateTime(2022, 1, 1),
      crewId: 1,
      endDate: DateTime(2022, 1, 5),
      id: 1,
      memberNote: 'note',
      startDate: DateTime(2022, 1, 1),
      type: AbsenceType.sickness,
      userId: 1,
      member: const Member(id: 1, crewId: 1, name: 'John Doe', userId: 1),
    );

    test('correctly calculates the number of days', () {
      expect(absence.days, 5);
    });

    test('correctly identifies the status', () {
      expect(absence.status, AbsenceStatus.requested);
      expect(absence.copyWith(confirmedAt: DateTime.now()).status, AbsenceStatus.confirmed);
      expect(absence.copyWith(rejectedAt: DateTime.now()).status, AbsenceStatus.rejected);
    });

    test('correctly creates a copy with new values', () {
      expect(
        absence.copyWith(
          admitterNote: 'new note',
          createdAt: DateTime(2022, 2, 2),
          crewId: 2,
          endDate: DateTime(2022, 2, 6),
          id: 2,
          memberNote: 'new note',
          startDate: DateTime(2022, 2, 2),
          type: AbsenceType.vacation,
          userId: 2,
          member: const Member(id: 2, crewId: 2, name: 'Jane Doe', userId: 2),
        ),
        Absence(
          admitterNote: 'new note',
          createdAt: DateTime(2022, 2, 2),
          crewId: 2,
          endDate: DateTime(2022, 2, 6),
          id: 2,
          memberNote: 'new note',
          startDate: DateTime(2022, 2, 2),
          type: AbsenceType.vacation,
          userId: 2,
          member: const Member(id: 2, crewId: 2, name: 'Jane Doe', userId: 2),
        ),
      );
    });

    test('correctly creates an instance from JSON', () {
      expect(
        Absence.fromJson(const {
          'admitterNote': 'note',
          'createdAt': '2022-01-01',
          'crewId': 1,
          'endDate': '2022-01-05',
          'id': 1,
          'memberNote': 'note',
          'startDate': '2022-01-01',
          'type': 'sickness',
          'userId': 1,
          'member': {
            'id': 1,
            'crewId': 1,
            'name': 'John Doe',
            'userId': 1,
          },
        }),
        absence,
      );
    });
  });
}
