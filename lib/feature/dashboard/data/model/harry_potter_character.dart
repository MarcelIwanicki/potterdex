import 'dart:core';

import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@entity
class HarryPotterCharacter extends Equatable {
  @primaryKey
  final int id;

  final String name;
  final String species;
  final String gender;
  final String house;
  final String dateOfBirth;
  final String yearOfBirth;
  final String ancestry;
  final String eyeColour;
  final String hairColour;
  final String wandWood;
  final String wandCore;
  final double wandLength;
  final String patronus;
  final bool hogwartsStudent;
  final bool hogwartsStaff;
  final String actor;
  final bool alive;
  final String image;

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
      required this.wandWood,
      required this.wandCore,
      required this.wandLength,
      required this.patronus,
      required this.hogwartsStudent,
      required this.hogwartsStaff,
      required this.actor,
      required this.alive,
      required this.image});

  factory HarryPotterCharacter.fromJson(Map<String, dynamic> json) {
    dynamic jsonWandLength = json['wand']['length'];
    double wandLengthDouble = .0;
    if (jsonWandLength is int) {
      wandLengthDouble = jsonWandLength.toDouble();
    } else if (jsonWandLength is double) {
      wandLengthDouble = jsonWandLength;
    }

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
      wandWood: json['wand']['wood'],
      wandCore: json['wand']['core'],
      wandLength: wandLengthDouble,
      patronus: json['patronus'],
      hogwartsStudent: json['hogwartsStudent'],
      hogwartsStaff: json['hogwartsStaff'],
      actor: json['actor'],
      alive: json['alive'],
      image: json['image'],
    );
  }

  @override
  List<Object?> get props => [name];
}
