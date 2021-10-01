import 'dart:core';

import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@entity
class HarryPotterCharacter extends Equatable {
  static const String DEFAULT_OFFLINE_IMAGE =
      "https://bibliotekant.pl/wp-content/uploads/2021/04/placeholder-image.png";

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
  final bool favorite;

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
      required this.image,
      required this.favorite});

  factory HarryPotterCharacter.empty() => HarryPotterCharacter(
      id: 0,
      name: "",
      species: "",
      gender: "",
      house: "",
      dateOfBirth: "",
      yearOfBirth: "",
      ancestry: "",
      eyeColour: "",
      hairColour: "",
      wandWood: "",
      wandCore: "",
      wandLength: .0,
      patronus: "",
      hogwartsStudent: false,
      hogwartsStaff: false,
      actor: "",
      alive: false,
      image: DEFAULT_OFFLINE_IMAGE,
      favorite: false);

  factory HarryPotterCharacter.clone(
          HarryPotterCharacter harryPotterCharacter, bool newFavorite) =>
      HarryPotterCharacter(
          id: harryPotterCharacter.id,
          name: harryPotterCharacter.name,
          species: harryPotterCharacter.species,
          gender: harryPotterCharacter.gender,
          house: harryPotterCharacter.house,
          dateOfBirth: harryPotterCharacter.dateOfBirth,
          yearOfBirth: harryPotterCharacter.yearOfBirth,
          ancestry: harryPotterCharacter.ancestry,
          eyeColour: harryPotterCharacter.eyeColour,
          hairColour: harryPotterCharacter.hairColour,
          wandWood: harryPotterCharacter.wandWood,
          wandCore: harryPotterCharacter.wandCore,
          wandLength: harryPotterCharacter.wandLength,
          patronus: harryPotterCharacter.patronus,
          hogwartsStudent: harryPotterCharacter.hogwartsStudent,
          hogwartsStaff: harryPotterCharacter.hogwartsStaff,
          actor: harryPotterCharacter.actor,
          alive: harryPotterCharacter.alive,
          image: harryPotterCharacter.image,
          favorite: newFavorite);

  factory HarryPotterCharacter.fromJson(Map<String, dynamic> json) {
    dynamic jsonWandLength = json['wand']['length'];
    double wandLengthDouble = .0;
    if (jsonWandLength is int) {
      wandLengthDouble = jsonWandLength.toDouble();
    } else if (jsonWandLength is double) {
      wandLengthDouble = jsonWandLength;
    }

    return HarryPotterCharacter(
      id: json['name'].hashCode,
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
      favorite: false,
    );
  }

  @override
  List<Object?> get props => [name];

  @override
  String toString() {
    return 'HarryPotterCharacter{id: $id, name: $name, species: $species, gender: $gender, house: $house, dateOfBirth: $dateOfBirth, yearOfBirth: $yearOfBirth, ancestry: $ancestry, eyeColour: $eyeColour, hairColour: $hairColour, wandWood: $wandWood, wandCore: $wandCore, wandLength: $wandLength, patronus: $patronus, hogwartsStudent: $hogwartsStudent, hogwartsStaff: $hogwartsStaff, actor: $actor, alive: $alive, image: $image, favorite: $favorite}';
  }
}
