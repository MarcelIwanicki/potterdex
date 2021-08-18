import 'dart:core';

class HarryPotterCharacter {
  String name;
  String species;
  String gender;
  String house;
  String dateOfBirth;
  dynamic yearOfBirth;
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
      {required this.name,
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
      name: json['name'],
      species: json['species'],
      gender: json['gender'],
      house: json['house'],
      dateOfBirth: json['dateOfBirth'],
      yearOfBirth: json['yearOfBirth'],
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
}

class Wand {
  String wood;
  String core;
  dynamic length;

  Wand({
    required this.wood,
    required this.core,
    required this.length,
  });

  factory Wand.fromJson(Map<String, dynamic> json) {
    return Wand(wood: json['wood'], core: json['core'], length: json['length']);
  }
}
