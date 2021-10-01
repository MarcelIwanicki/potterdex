import 'package:bloc/bloc.dart';
import 'package:potterdex/feature/dashboard/data/model/harry_potter_character.dart';
import 'package:potterdex/feature/dashboard/data/repository/service/harry_potter_characters_service.dart';

part 'edit_character_state.dart';

class EditCharacterCubit extends Cubit<EditCharacterState> {
  final HarryPotterCharactersService _service;
  final HarryPotterCharacter _harryPotterCharacter;

  EditCharacterCubit(this._service, this._harryPotterCharacter)
      : super(EditCharacterInitial(_harryPotterCharacter));

  DateTime get birthDate => state._birthDate ?? DateTime.now();

  void initializeCubit(HarryPotterCharacter character) =>
      emit(EditCharacterInitial(character));

  void deleteCharacter() {
    _service.deleteHarryPotterCharacterFromLocalDatabase(state.name.hashCode);
  }

  void editBirthDate(DateTime birthDate) => emit(EditCharacterEditValue(
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
        image: state._image,
        favorite: state._favorite,
      ));

  void editGender(String gender) => emit(EditCharacterEditValue(
        birthDate: state._birthDate ?? DateTime.now(),
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
        image: state._image,
        favorite: state._favorite,
      ));

  void editName(String name) => emit(EditCharacterEditValue(
        birthDate: state._birthDate ?? DateTime.now(),
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
        image: state._image,
        favorite: state._favorite,
      ));

  void editHouse(String house) => emit(EditCharacterEditValue(
        birthDate: state._birthDate ?? DateTime.now(),
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
        image: state._image,
        favorite: state._favorite,
      ));

  void editEyesColor(String eyesColor) => emit(EditCharacterEditValue(
        birthDate: state._birthDate ?? DateTime.now(),
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
        image: state._image,
        favorite: state._favorite,
      ));

  void editHairColor(String hairColor) => emit(EditCharacterEditValue(
        birthDate: state._birthDate ?? DateTime.now(),
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
        image: state._image,
        favorite: state._favorite,
      ));

  void editPatronus(String patronus) => emit(EditCharacterEditValue(
        birthDate: state._birthDate ?? DateTime.now(),
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
        image: state._image,
        favorite: state._favorite,
      ));

  void editAncestry(String ancestry) => emit(EditCharacterEditValue(
        birthDate: state._birthDate ?? DateTime.now(),
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
        image: state._image,
        favorite: state._favorite,
      ));

  void editSpecies(String species) => emit(EditCharacterEditValue(
        birthDate: state._birthDate ?? DateTime.now(),
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
        image: state._image,
        favorite: state._favorite,
      ));

  void editLifeCondition(String lifeCondition) => emit(EditCharacterEditValue(
        birthDate: state._birthDate ?? DateTime.now(),
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
        image: state._image,
        favorite: state._favorite,
      ));

  void editHogwartsRole(String hogwartsRole) => emit(EditCharacterEditValue(
        birthDate: state._birthDate ?? DateTime.now(),
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
        image: state._image,
        favorite: state._favorite,
      ));

  void editActor(String actor) => emit(EditCharacterEditValue(
        birthDate: state._birthDate ?? DateTime.now(),
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
        image: state._image,
        favorite: state._favorite,
      ));

  void clearData() => emit(EditCharacterInitial(_harryPotterCharacter));

  void editHarryPotterCharacterInLocalDatabase() => emit(EditCharacterSucceeded(
        birthDate: state._birthDate ?? DateTime.now(),
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
        image: state._image,
        favorite: state._favorite,
        service: _service,
        harryPotterCharacter: _harryPotterCharacter,
      ));
}
