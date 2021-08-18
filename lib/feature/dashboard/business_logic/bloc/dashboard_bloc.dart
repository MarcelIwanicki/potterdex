import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:potterdex/feature/dashboard/data/model/harry_potter_character.dart';
import 'package:potterdex/feature/dashboard/data/repository/harry_potter_repository.dart';

part 'dashboard_event.dart';

part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  HarryPotterRepository repository;

  DashboardBloc(this.repository) : super(DashboardInitialState());

  @override
  Stream<DashboardState> mapEventToState(
    DashboardEvent event,
  ) async* {
    if (event is GetHarryPotterCharactersEvent) {
      yield HarryPotterCharactersAreLoadingState();

      try {
        List<HarryPotterCharacter> harryPotterCharacters =
            await repository.getHarryPotterCharacters();
        yield HarryPotterCharactersAreLoadedState(harryPotterCharacters);
      } catch (e) {
        yield HarryPotterCharactersAreNotLoadedState();
      }
    } else if (event is ResetHarryPotterCharactersEvent) {
      yield HarryPotterCharactersAreNotLoadedState();
    }
  }
}
