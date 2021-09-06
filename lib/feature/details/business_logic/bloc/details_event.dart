part of 'details_bloc.dart';

abstract class DetailsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetHarryPotterCharacterDetailsEvent extends DetailsEvent {}

class ResetHarryPotterCharacterDetailsEvent extends DetailsEvent {}
