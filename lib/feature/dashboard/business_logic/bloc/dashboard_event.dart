part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetHarryPotterCharactersDashboardEvent extends DashboardEvent {}

class ResetHarryPotterCharactersDashboardEvent extends DashboardEvent {}
