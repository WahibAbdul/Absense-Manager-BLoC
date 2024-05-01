import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'member.dart';

@immutable
class Absence extends Equatable {
  final String admitterNote;
  final DateTime? confirmedAt;
  final DateTime? createdAt;
  final int crewId;
  final DateTime? endDate;
  final int id;
  final String memberNote;
  final DateTime? rejectedAt;
  final DateTime? startDate;
  final AbsenceType type;
  final int userId;
  final Member member;

  const Absence({
    required this.admitterNote,
    this.confirmedAt,
    required this.createdAt,
    required this.crewId,
    required this.endDate,
    required this.id,
    required this.memberNote,
    this.rejectedAt,
    required this.startDate,
    required this.type,
    required this.userId,
    required this.member,
  });

  Absence copyWith({
    String? admitterNote,
    DateTime? confirmedAt,
    DateTime? createdAt,
    int? crewId,
    DateTime? endDate,
    int? id,
    String? memberNote,
    DateTime? rejectedAt,
    DateTime? startDate,
    AbsenceType? type,
    int? userId,
    Member? member,
  }) =>
      Absence(
        admitterNote: admitterNote ?? this.admitterNote,
        confirmedAt: confirmedAt ?? this.confirmedAt,
        createdAt: createdAt ?? this.createdAt,
        crewId: crewId ?? this.crewId,
        endDate: endDate ?? this.endDate,
        id: id ?? this.id,
        memberNote: memberNote ?? this.memberNote,
        rejectedAt: rejectedAt ?? this.rejectedAt,
        startDate: startDate ?? this.startDate,
        type: type ?? this.type,
        userId: userId ?? this.userId,
        member: member ?? this.member,
      );

  factory Absence.fromJson(Map<String, dynamic> json) => Absence(
        admitterNote: json["admitterNote"],
        confirmedAt: json["confirmedAt"] != null ? DateTime.parse(json["confirmedAt"]) : null,
        crewId: json["crewId"],
        id: json["id"],
        memberNote: json["memberNote"],
        createdAt: json["createdAt"] != null ? DateTime.parse(json["createdAt"]) : null,
        endDate: json["endDate"] != null ? DateTime.parse(json["endDate"]) : null,
        rejectedAt: json["rejectedAt"] != null ? DateTime.parse(json["rejectedAt"]) : null,
        startDate: json["startDate"] != null ? DateTime.parse(json["startDate"]) : null,
        type: AbsenceType.fromString(json["type"]),
        userId: json["userId"],
        member: Member.fromJson(json["member"]),
      );

  AbsenceStatus get status {
    if (confirmedAt != null) {
      return AbsenceStatus.confirmed;
    } else if (rejectedAt != null) {
      return AbsenceStatus.rejected;
    } else {
      return AbsenceStatus.requested;
    }
  }

  @override
  List<Object?> get props => [
        admitterNote,
        confirmedAt,
        createdAt,
        crewId,
        endDate,
        id,
        memberNote,
        rejectedAt,
        startDate,
        type,
        userId,
        member,
      ];
}

enum AbsenceStatus {
  requested,
  confirmed,
  rejected;
}

enum AbsenceType {
  other,
  sickness,
  vacation;

  static AbsenceType fromString(String? type) {
    return switch (type) {
      'sickness' => AbsenceType.sickness,
      'vacation' => AbsenceType.vacation,
      _ => AbsenceType.other
    };
  }
}
