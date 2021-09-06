import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:potterdex/feature/dashboard/data/model/harry_potter_character.dart';
import 'package:potterdex/feature/dashboard/data/repository/service/harry_potter_characters_service.dart';

part 'dashboard_event.dart';

part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  HarryPotterCharactersService service;

  DashboardBloc(this.service) : super(DashboardInitialState());

  @override
  Stream<DashboardState> mapEventToState(
    DashboardEvent event,
  ) async* {
    yield HarryPotterCharactersAreLoadingState();

    Function(List<HarryPotterCharacter>) filterFunction =
        _getFilterFunctionBasedOnEvent(event);

    if (event is ResetHarryPotterCharactersDashboardEvent) {
      yield HarryPotterCharactersAreNotLoadedState();
    } else {
      try {
        await service.loadHarryPotterCharactersFromRemoteToLocalDatabase();
        List<HarryPotterCharacter> harryPotterCharacters =
            await service.getHarryPotterCharactersFromLocalDatabase();
        List<HarryPotterCharacter> filteredHarryPotterCharacters =
            filterFunction(harryPotterCharacters);
        yield HarryPotterCharactersAreLoadedState(
            filteredHarryPotterCharacters);
      } catch (e) {
        yield HarryPotterCharactersAreNotLoadedState();
      }
    }
  }

  Function(List<HarryPotterCharacter>) _getFilterFunctionBasedOnEvent(
      DashboardEvent event) {
    if (event is FilterHarryPotterCharactersDashboardByFavoriteEvent) {
      return _filterCharactersByFavorite;
    } else if (event is FilterHarryPotterCharactersDashboardByHumanEvent) {
      return _filterCharactersByHuman;
    } else if (event is FilterHarryPotterCharactersDashboardByFemaleEvent) {
      return _filterCharactersByFemale;
    } else if (event is FilterHarryPotterCharactersDashboardByMaleEvent) {
      return _filterCharactersByMale;
    } else if (event is FilterHarryPotterCharactersDashboardByGryffindorEvent) {
      return _filterCharactersByGryffindor;
    } else if (event is FilterHarryPotterCharactersDashboardByHufflepuffEvent) {
      return _filterCharactersByHufflepuff;
    } else if (event is FilterHarryPotterCharactersDashboardBySlytherinEvent) {
      return _filterCharactersBySlytherin;
    } else if (event is FilterHarryPotterCharactersDashboardByRavenclawEvent) {
      return _filterCharactersByRavenclaw;
    }

    return _dontFilter;
  }

  List<HarryPotterCharacter> _dontFilter(
          List<HarryPotterCharacter> characters) =>
      characters;

  List<HarryPotterCharacter> _filterCharactersByFavorite(
          List<HarryPotterCharacter> characters) =>
      characters.where((element) => element.favorite).toList();

  List<HarryPotterCharacter> _filterCharactersByHuman(
          List<HarryPotterCharacter> characters) =>
      characters.where((element) => element.species == "human").toList();

  List<HarryPotterCharacter> _filterCharactersByFemale(
          List<HarryPotterCharacter> characters) =>
      characters.where((element) => element.gender == "female").toList();

  List<HarryPotterCharacter> _filterCharactersByMale(
          List<HarryPotterCharacter> characters) =>
      characters.where((element) => element.gender == "male").toList();

  List<HarryPotterCharacter> _filterCharactersByGryffindor(
          List<HarryPotterCharacter> characters) =>
      characters.where((element) => element.house == "Gryffindor").toList();

  List<HarryPotterCharacter> _filterCharactersByHufflepuff(
          List<HarryPotterCharacter> characters) =>
      characters.where((element) => element.house == "Hufflepuff").toList();

  List<HarryPotterCharacter> _filterCharactersBySlytherin(
          List<HarryPotterCharacter> characters) =>
      characters.where((element) => element.house == "Slytherin").toList();

  List<HarryPotterCharacter> _filterCharactersByRavenclaw(
          List<HarryPotterCharacter> characters) =>
      characters.where((element) => element.house == "Ravenclaw").toList();
}
