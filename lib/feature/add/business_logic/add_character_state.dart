part of 'add_character_cubit.dart';

abstract class AddCharacterState {
  final DateTime _birthDate;
  final String _gender;
  final String _name;
  final String _house;
  final String _eyesColor;
  final String _hairColor;
  final String _patronus;
  final String _ancestry;
  final String _species;
  final String _lifeCondition;
  final String _hogwartsRole;
  final String _actor;

  const AddCharacterState({
    required DateTime birthDate,
    required String gender,
    required String name,
    required String house,
    required String eyesColor,
    required String hairColor,
    required String patronus,
    required String ancestry,
    required String species,
    required String lifeCondition,
    required String hogwartsRole,
    required String actor,
  })  : _birthDate = birthDate,
        _gender = gender,
        _name = name,
        _house = house,
        _eyesColor = eyesColor,
        _hairColor = hairColor,
        _patronus = patronus,
        _ancestry = ancestry,
        _species = species,
        _lifeCondition = lifeCondition,
        _hogwartsRole = hogwartsRole,
        _actor = actor;

  String get actor => _actor;

  String get hogwartsRole => _hogwartsRole;

  String get lifeCondition => _lifeCondition;

  String get species => _species;

  String get ancestry => _ancestry;

  String get patronus => _patronus;

  String get hairColor => _hairColor;

  String get eyesColor => _eyesColor;

  String get house => _house;

  String get name => _name;

  String get gender => _gender;

  DateTime get birthDate => _birthDate;
}

class AddCharacterInitial extends AddCharacterState {
  AddCharacterInitial()
      : super(
            birthDate: DateTime.now(),
            gender: "female",
            name: "",
            house: "Gryffindor",
            eyesColor: "",
            hairColor: "",
            patronus: "",
            ancestry: "pure-blood",
            species: "",
            lifeCondition: "Alive",
            hogwartsRole: "Student",
            actor: "");
}

class AddCharacterEditValue extends AddCharacterState {
  AddCharacterEditValue({
    required DateTime birthDate,
    required String gender,
    required String name,
    required String house,
    required String eyesColor,
    required String hairColor,
    required String patronus,
    required String ancestry,
    required String species,
    required String lifeCondition,
    required String hogwartsRole,
    required String actor,
  }) : super(
            birthDate: birthDate,
            gender: gender,
            name: name,
            house: house,
            eyesColor: eyesColor,
            hairColor: hairColor,
            patronus: patronus,
            ancestry: ancestry,
            species: species,
            lifeCondition: lifeCondition,
            hogwartsRole: hogwartsRole,
            actor: actor);
}

class AddCharacterSucceeded extends AddCharacterState {
  AddCharacterSucceeded({
    required DateTime birthDate,
    required String gender,
    required String name,
    required String house,
    required String eyesColor,
    required String hairColor,
    required String patronus,
    required String ancestry,
    required String species,
    required String lifeCondition,
    required String hogwartsRole,
    required String actor,
    required HarryPotterCharactersService service,
  }) : super(
            birthDate: birthDate,
            gender: gender,
            name: name,
            house: house,
            eyesColor: eyesColor,
            hairColor: hairColor,
            patronus: patronus,
            ancestry: ancestry,
            species: species,
            lifeCondition: lifeCondition,
            hogwartsRole: hogwartsRole,
            actor: actor) {
    service.addHarryPotterCharacterToLocalDatabase(
        _getHarryPotterCharacterFromValues());
  }

  HarryPotterCharacter _getHarryPotterCharacterFromValues() =>
      HarryPotterCharacter(
          id: _name.hashCode,
          name: _name,
          species: _species,
          gender: _gender,
          house: _house,
          dateOfBirth:
              "${_birthDate.year}-${_birthDate.month}-${_birthDate.day}",
          yearOfBirth: _birthDate.year.toString(),
          ancestry: _ancestry,
          eyeColour: _eyesColor,
          hairColour: _hairColor,
          wandWood: "",
          wandCore: "",
          wandLength: .0,
          patronus: _patronus,
          hogwartsStudent: _hogwartsRole == "Student" ? true : false,
          hogwartsStaff: _hogwartsRole == "Staff" ? true : false,
          actor: _actor,
          alive: _lifeCondition == "Alive" ? true : false,
          image: HarryPotterCharacter.DEFAULT_OFFLINE_IMAGE,
          favorite: false);
}
