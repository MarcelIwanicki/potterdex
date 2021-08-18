import 'package:injector/injector.dart';
import 'package:potterdex/feature/dashboard/business_logic/bloc/dashboard_bloc.dart';
import 'package:potterdex/feature/dashboard/data/repository/harry_potter_repository.dart';

void registerDashobardModule() {
  final injector = Injector.appInstance;

  injector.registerSingleton<DashboardBloc>(
      () => DashboardBloc(injector.get<HarryPotterRepository>()));
}
