import 'package:absence_mananger/common/models/absence.dart';
import 'package:flutter/material.dart';

@immutable
class AbsenceListResponse {
  final List<Absence> data;
  final int total;

  const AbsenceListResponse({
    required this.data,
    required this.total,
  });

  factory AbsenceListResponse.fromJson(Map<String, dynamic> json) => AbsenceListResponse(
        data: json["data"] == null ? [] : List<Absence>.from(json["data"]!.map((x) => Absence.fromJson(x))),
        total: json["total"] ?? 0,
      );
}
