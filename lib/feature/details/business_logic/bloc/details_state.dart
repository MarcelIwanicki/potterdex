part of 'details_bloc.dart';

abstract class DetailsState extends Equatable {
  @override
  List<Object> get props => [];
}

class DetailsInitialState extends DetailsState {}

class HarryPotterCharacterIsLoadingState extends DetailsState {}

class HarryPotterCharacterIsLoadedState extends DetailsState {
  final HarryPotterCharacter _character;

  HarryPotterCharacterIsLoadedState(this._character);

  HarryPotterCharacter get getCharacter => _character;

  @override
  List<Object> get props => [_character];
}

class HarryPotterCharacterIsNotLoadedState extends DetailsState {}
