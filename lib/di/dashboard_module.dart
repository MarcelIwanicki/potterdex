import 'package:injector/injector.dart';
import 'package:potterdex/feature/dashboard/business_logic/bloc/dashboard_bloc.dart';
import 'package:potterdex/feature/dashboard/business_logic/cubit/close_container_cubit.dart';
import 'package:potterdex/feature/dashboard/data/repository/remote/harry_potter_characters_repository.dart';

void registerDashobardModule() {
  final injector = Injector.appInstance;

  injector.registerSingleton<DashboardBloc>(
      () => DashboardBloc(injector.get<HarryPotterCharactersRepository>()));

  injector.registerSingleton<CloseContainerCubit>(() => CloseContainerCubit());
}
