import 'package:injector/injector.dart';
import 'package:potterdex/feature/details/business_logic/bloc/details_bloc.dart';
import 'package:potterdex/feature/details/business_logic/cubit/details_favorite_cubit.dart';

void registerDetailsModule() {
  final injector = Injector.appInstance;

  injector.registerSingleton<DetailsBloc>(() => DetailsBloc(injector.get()));

  injector.registerSingleton<DetailsFavoriteCubit>(
      () => DetailsFavoriteCubit(injector.get()));
}
