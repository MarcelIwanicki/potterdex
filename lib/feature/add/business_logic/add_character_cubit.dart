import 'package:bloc/bloc.dart';
import 'package:potterdex/feature/dashboard/data/model/harry_potter_character.dart';
import 'package:potterdex/feature/dashboard/data/repository/service/harry_potter_characters_service.dart';

part 'add_character_state.dart';

class AddCharacterCubit extends Cubit<AddCharacterState> {
  final HarryPotterCharactersService _service;

  AddCharacterCubit(this._service) : super(AddCharacterInitial());

  DateTime get birthDate => state._birthDate;

  void editBirthDate(DateTime birthDate) => emit(AddCharacterEditValue(
        birthDate: birthDate,
        gender: state._gender,
        name: state._name,
        house: state._house,
        eyesColor: state._eyesColor,
        hairColor: state._hairColor,
        patronus: state._patronus,
        ancestry: state._ancestry,
        species: state._species,
        lifeCondition: state._lifeCondition,
        hogwartsRole: state._hogwartsRole,
        actor: state._actor,
      ));

  void editGender(String gender) => emit(AddCharacterEditValue(
        birthDate: state._birthDate,
        gender: gender,
        name: state._name,
        house: state._house,
        eyesColor: state._eyesColor,
        hairColor: state._hairColor,
        patronus: state._patronus,
        ancestry: state._ancestry,
        species: state._species,
        lifeCondition: state._lifeCondition,
        hogwartsRole: state._hogwartsRole,
        actor: state._actor,
      ));

  void editName(String name) => emit(AddCharacterEditValue(
        birthDate: state._birthDate,
        gender: state._gender,
        name: name,
        house: state._house,
        eyesColor: state._eyesColor,
        hairColor: state._hairColor,
        patronus: state._patronus,
        ancestry: state._ancestry,
        species: state._species,
        lifeCondition: state._lifeCondition,
        hogwartsRole: state._hogwartsRole,
        actor: state._actor,
      ));

  void editHouse(String house) => emit(AddCharacterEditValue(
        birthDate: state._birthDate,
        gender: state._gender,
        name: state._name,
        house: house,
        eyesColor: state._eyesColor,
        hairColor: state._hairColor,
        patronus: state._patronus,
        ancestry: state._ancestry,
        species: state._species,
        lifeCondition: state._lifeCondition,
        hogwartsRole: state._hogwartsRole,
        actor: state._actor,
      ));

  void editEyesColor(String eyesColor) => emit(AddCharacterEditValue(
        birthDate: state._birthDate,
        gender: state._gender,
        name: state._name,
        house: state._house,
        eyesColor: eyesColor,
        hairColor: state._hairColor,
        patronus: state._patronus,
        ancestry: state._ancestry,
        species: state._species,
        lifeCondition: state._lifeCondition,
        hogwartsRole: state._hogwartsRole,
        actor: state._actor,
      ));

  void editHairColor(String hairColor) => emit(AddCharacterEditValue(
        birthDate: state._birthDate,
        gender: state._gender,
        name: state._name,
        house: state._house,
        eyesColor: state._eyesColor,
        hairColor: hairColor,
        patronus: state._patronus,
        ancestry: state._ancestry,
        species: state._species,
        lifeCondition: state._lifeCondition,
        hogwartsRole: state._hogwartsRole,
        actor: state._actor,
      ));

  void editPatronus(String patronus) => emit(AddCharacterEditValue(
        birthDate: state._birthDate,
        gender: state._gender,
        name: state._name,
        house: state._house,
        eyesColor: state._eyesColor,
        hairColor: state._hairColor,
        patronus: patronus,
        ancestry: state._ancestry,
        species: state._species,
        lifeCondition: state._lifeCondition,
        hogwartsRole: state._hogwartsRole,
        actor: state._actor,
      ));

  void editAncestry(String ancestry) => emit(AddCharacterEditValue(
        birthDate: state._birthDate,
        gender: state._gender,
        name: state._name,
        house: state._house,
        eyesColor: state._eyesColor,
        hairColor: state._hairColor,
        patronus: state._patronus,
        ancestry: ancestry,
        species: state._species,
        lifeCondition: state._lifeCondition,
        hogwartsRole: state._hogwartsRole,
        actor: state._actor,
      ));

  void editSpecies(String species) => emit(AddCharacterEditValue(
        birthDate: state._birthDate,
        gender: state._gender,
        name: state._name,
        house: state._house,
        eyesColor: state._eyesColor,
        hairColor: state._hairColor,
        patronus: state._patronus,
        ancestry: state._ancestry,
        species: species,
        lifeCondition: state._lifeCondition,
        hogwartsRole: state._hogwartsRole,
        actor: state._actor,
      ));

  void editLifeCondition(String lifeCondition) => emit(AddCharacterEditValue(
        birthDate: state._birthDate,
        gender: state._gender,
        name: state._name,
        house: state._house,
        eyesColor: state._eyesColor,
        hairColor: state._hairColor,
        patronus: state._patronus,
        ancestry: state._ancestry,
        species: state._species,
        lifeCondition: lifeCondition,
        hogwartsRole: state._hogwartsRole,
        actor: state._actor,
      ));

  void editHogwartsRole(String hogwartsRole) => emit(AddCharacterEditValue(
        birthDate: state._birthDate,
        gender: state._gender,
        name: state._name,
        house: state._house,
        eyesColor: state._eyesColor,
        hairColor: state._hairColor,
        patronus: state._patronus,
        ancestry: state._ancestry,
        species: state._species,
        lifeCondition: state._lifeCondition,
        hogwartsRole: hogwartsRole,
        actor: state._actor,
      ));

  void editActor(String actor) => emit(AddCharacterEditValue(
        birthDate: state._birthDate,
        gender: state._gender,
        name: state._name,
        house: state._house,
        eyesColor: state._eyesColor,
        hairColor: state._hairColor,
        patronus: state._patronus,
        ancestry: state._ancestry,
        species: state._species,
        lifeCondition: state._lifeCondition,
        hogwartsRole: state._hogwartsRole,
        actor: actor,
      ));

  void clearData() => emit(AddCharacterInitial());

  void addHarryPotterCharacterToLocalDatabase() => emit(AddCharacterSucceeded(
        birthDate: state._birthDate,
        gender: state._gender,
        name: state._name,
        house: state._house,
        eyesColor: state._eyesColor,
        hairColor: state._hairColor,
        patronus: state._patronus,
        ancestry: state._ancestry,
        species: state._species,
        lifeCondition: state._lifeCondition,
        hogwartsRole: state._hogwartsRole,
        actor: state._actor,
        service: _service,
      ));
}
