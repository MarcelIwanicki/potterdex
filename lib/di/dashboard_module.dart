import 'package:injector/injector.dart';
import 'package:potterdex/feature/dashboard/business_logic/bloc/dashboard_bloc.dart';
import 'package:potterdex/feature/dashboard/business_logic/cubit/close_container_cubit.dart';
import 'package:potterdex/feature/dashboard/data/repository/service/harry_potter_characters_service.dart';

void registerDashobardModule() {
  final injector = Injector.appInstance;

  injector.registerSingleton<DashboardBloc>(
      () => DashboardBloc(injector.get<HarryPotterCharactersService>()));

  injector.registerSingleton<CloseContainerCubit>(() => CloseContainerCubit());
}
