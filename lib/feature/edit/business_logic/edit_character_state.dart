part of 'edit_character_cubit.dart';

abstract class EditCharacterState {
  final DateTime? _birthDate;
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
  final String _image;
  final bool _favorite;

  const EditCharacterState({
    required DateTime? birthDate,
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
    required String image,
    required bool favorite,
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
        _actor = actor,
        _image = image,
        _favorite = favorite;

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

  String get image => _image;

  bool get favorite => _favorite;

  DateTime? get birthDate => _birthDate;

  @override
  String toString() {
    return 'EditCharacterState{_birthDate: $_birthDate, _gender: $_gender, _name: $_name, _house: $_house, _eyesColor: $_eyesColor, _hairColor: $_hairColor, _patronus: $_patronus, _ancestry: $_ancestry, _species: $_species, _lifeCondition: $_lifeCondition, _hogwartsRole: $_hogwartsRole, _actor: $_actor}';
  }
}

class EditCharacterInitial extends EditCharacterState {
  EditCharacterInitial(HarryPotterCharacter character)
      : super(
            birthDate: DateTime.now(),
            gender: character.gender,
            name: character.name,
            house: character.house,
            eyesColor: character.eyeColour,
            hairColor: character.hairColour,
            patronus: character.patronus,
            ancestry: character.ancestry,
            species: character.species,
            lifeCondition: character.alive == true ? "Alive" : "Dead",
            hogwartsRole: character.hogwartsStudent ? "Student" : "Staff",
            actor: character.actor,
            image: character.image,
            favorite: character.favorite);
}

class EditCharacterEditValue extends EditCharacterState {
  EditCharacterEditValue({
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
    required String image,
    required bool favorite,
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
            actor: actor,
            image: image,
            favorite: favorite);
}

class EditCharacterSucceeded extends EditCharacterState {
  EditCharacterSucceeded({
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
    required String image,
    required bool favorite,
    required HarryPotterCharacter harryPotterCharacter,
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
            actor: actor,
            image: image,
            favorite: favorite) {
    service.updateHarryPotterCharacterInLocalDatabase(
        _getHarryPotterCharacterFromValues(harryPotterCharacter));
  }

  HarryPotterCharacter _getHarryPotterCharacterFromValues(
          HarryPotterCharacter character) =>
      HarryPotterCharacter(
          id: _name.hashCode,
          name: _name,
          species: _species,
          gender: _gender,
          house: _house,
          dateOfBirth:
              "${_birthDate?.year}-${_birthDate?.month}-${_birthDate?.day}",
          yearOfBirth: _birthDate?.year.toString() ?? "",
          ancestry: _ancestry,
          eyeColour: _eyesColor,
          hairColour: _hairColor,
          wandWood: character.wandWood,
          wandCore: character.wandCore,
          wandLength: character.wandLength,
          patronus: _patronus,
          hogwartsStudent: _hogwartsRole == "Student" ? true : false,
          hogwartsStaff: _hogwartsRole == "Staff" ? true : false,
          actor: _actor,
          alive: _lifeCondition == "Alive" ? true : false,
          image: _image,
          favorite: _favorite);
}
