import 'dart:core';

import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@entity
class HarryPotterCharacter extends Equatable {
  @primaryKey
  final int id;

  String name;
  String species;
  String gender;
  String house;
  String dateOfBirth;
  String yearOfBirth;
  String ancestry;
  String eyeColour;
  String hairColour;
  Wand wand;
  String patronus;
  bool hogwartsStudent;
  bool hogwartsStaff;
  String actor;
  bool alive;
  String image;

  HarryPotterCharacter(
      {required this.id,
      required this.name,
      required this.species,
      required this.gender,
      required this.house,
      required this.dateOfBirth,
      required this.yearOfBirth,
      required this.ancestry,
      required this.eyeColour,
      required this.hairColour,
      required this.wand,
      required this.patronus,
      required this.hogwartsStudent,
      required this.hogwartsStaff,
      required this.actor,
      required this.alive,
      required this.image});

  factory HarryPotterCharacter.fromJson(Map<String, dynamic> json) {
    return HarryPotterCharacter(
      id: json.hashCode,
      name: json['name'],
      species: json['species'],
      gender: json['gender'],
      house: json['house'],
      dateOfBirth: json['dateOfBirth'],
      yearOfBirth: json['yearOfBirth'] is String
          ? json['yearOfBirth']
          : json['yearOfBirth'].toString(),
      ancestry: json['ancestry'],
      eyeColour: json['eyeColour'],
      hairColour: json['hairColour'],
      wand: Wand.fromJson(json['wand']),
      patronus: json['patronus'],
      hogwartsStudent: json['hogwartsStudent'],
      hogwartsStaff: json['hogwartsStaff'],
      actor: json['actor'],
      alive: json['alive'],
      image: json['image'],
    );
  }

  @override
  List<Object?> get props => [id];
}

@entity
class Wand extends Equatable {
  @primaryKey
  final int id;

  String wood;
  String core;
  dynamic length;

  Wand({
    required this.id,
    required this.wood,
    required this.core,
    required this.length,
  });

  factory Wand.fromJson(Map<String, dynamic> json) {
    return Wand(
        id: json.hashCode,
        wood: json['wood'],
        core: json['core'],
        length: json['length']);
  }

  @override
  List<Object?> get props => [id];
}
