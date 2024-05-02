import 'package:absence_mananger/common/models/member.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Member', () {
    const member = Member(
      crewId: 1,
      id: 1,
      image: 'image.png',
      name: 'John Doe',
      userId: 1,
    );

    test('correctly creates a copy with new values', () {
      expect(
        member.copyWith(
          crewId: 2,
          id: 2,
          image: 'new_image.png',
          name: 'Jane Doe',
          userId: 2,
        ),
        const Member(
          crewId: 2,
          id: 2,
          image: 'new_image.png',
          name: 'Jane Doe',
          userId: 2,
        ),
      );
    });

    test('correctly creates an instance from JSON', () {
      expect(
        Member.fromJson(const {
          'crewId': 1,
          'id': 1,
          'image': 'image.png',
          'name': 'John Doe',
          'userId': 1,
        }),
        member,
      );
    });
  });
}
