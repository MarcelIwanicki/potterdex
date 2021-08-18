part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  @override
  List<Object> get props => [];
}

class DashboardInitialState extends DashboardState {}

class HarryPotterCharactersAreLoadingState extends DashboardState {}

class HarryPotterCharactersAreLoadedState extends DashboardState {
  final List<HarryPotterCharacter> _characters;

  HarryPotterCharactersAreLoadedState(this._characters);

  List<HarryPotterCharacter> get getCharacters => _characters;

  @override
  List<Object> get props => [_characters];
}

class HarryPotterCharactersAreNotLoadedState extends DashboardState {}
