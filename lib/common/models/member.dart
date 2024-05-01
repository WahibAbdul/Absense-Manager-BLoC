import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Member extends Equatable {
  final int crewId;
  final int id;
  final String? image;
  final String name;
  final int userId;

  const Member({
    required this.crewId,
    required this.id,
    this.image,
    required this.name,
    required this.userId,
  });

  Member copyWith({
    int? crewId,
    int? id,
    String? image,
    String? name,
    int? userId,
  }) =>
      Member(
        crewId: crewId ?? this.crewId,
        id: id ?? this.id,
        image: image ?? this.image,
        name: name ?? this.name,
        userId: userId ?? this.userId,
      );

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        crewId: json["crewId"],
        id: json["id"],
        image: json.containsKey("image") ? json["image"] : null,
        name: json["name"],
        userId: json["userId"],
      );

  @override
  List<Object?> get props => [
        crewId,
        id,
        image,
        name,
        userId,
      ];
}
