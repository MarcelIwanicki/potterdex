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
    if (event is GetHarryPotterCharactersFromInternetEvent) {
      yield HarryPotterCharactersAreLoadingState();

      try {
        await service.loadHarryPotterCharactersFromRemoteToLocalDatabase();
        List<HarryPotterCharacter> harryPotterCharacters =
            await service.getHarryPotterCharactersFromLocalDatabase();
        yield HarryPotterCharactersAreLoadedState(harryPotterCharacters);
      } catch (e) {
        yield HarryPotterCharactersAreNotLoadedState();
      }
    } else if (event is ResetHarryPotterCharactersEvent) {
      yield HarryPotterCharactersAreNotLoadedState();
    }
  }
}
