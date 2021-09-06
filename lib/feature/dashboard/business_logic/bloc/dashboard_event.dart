part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetHarryPotterCharactersDashboardEvent extends DashboardEvent {}

class FilterHarryPotterCharactersDashboardByFavoriteEvent
    extends DashboardEvent {}

class FilterHarryPotterCharactersDashboardByHumanEvent extends DashboardEvent {}

class FilterHarryPotterCharactersDashboardByFemaleEvent extends DashboardEvent {
}

class FilterHarryPotterCharactersDashboardByMaleEvent extends DashboardEvent {}

class FilterHarryPotterCharactersDashboardByGryffindorEvent
    extends DashboardEvent {}

class FilterHarryPotterCharactersDashboardByHufflepuffEvent
    extends DashboardEvent {}

class FilterHarryPotterCharactersDashboardBySlytherinEvent
    extends DashboardEvent {}

class FilterHarryPotterCharactersDashboardByRavenclawEvent
    extends DashboardEvent {}

class ResetHarryPotterCharactersDashboardEvent extends DashboardEvent {}
