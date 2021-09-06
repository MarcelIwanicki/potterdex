import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:potterdex/feature/dashboard/data/model/harry_potter_character.dart';
import 'package:potterdex/feature/dashboard/data/repository/service/harry_potter_characters_service.dart';

part 'details_event.dart';

part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final HarryPotterCharactersService service;
  late int id;

  DetailsBloc(this.service) : super(DetailsInitialState());

  void initId(int id) {
    this.id = id;
  }

  @override
  Stream<DetailsState> mapEventToState(
    DetailsEvent event,
  ) async* {
    if (event is GetHarryPotterCharacterDetailsEvent) {
      yield HarryPotterCharacterIsLoadingState();

      try {
        HarryPotterCharacter? character =
            await service.getHarryPotterCharacterByIdFromLocalDatabase(id);

        if (character == null) {
          throw Exception();
        }

        yield HarryPotterCharacterIsLoadedState(character);
      } catch (e) {
        yield HarryPotterCharacterIsNotLoadedState();
      }
    } else if (event is ResetHarryPotterCharacterDetailsEvent) {
      yield HarryPotterCharacterIsNotLoadedState();
    }
  }
}
