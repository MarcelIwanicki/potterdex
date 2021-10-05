import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:potterdex/di/modules_initializer.dart';
import 'package:potterdex/feature/add/business_logic/add_character_cubit.dart';
import 'package:potterdex/feature/dashboard/business_logic/bloc/dashboard_bloc.dart';
import 'package:potterdex/feature/dashboard/business_logic/cubit/close_container_cubit.dart';
import 'package:potterdex/feature/dashboard/presentation/page/dashboard_page.dart';
import 'package:injector/injector.dart';
import 'package:potterdex/feature/details/business_logic/bloc/details_bloc.dart';
import 'package:potterdex/feature/details/business_logic/cubit/details_favorite_cubit.dart';
import 'package:potterdex/feature/edit/business_logic/edit_character_cubit.dart';
import 'package:potterdex/resources/values/app_colors.dart';
import 'package:potterdex/resources/values/app_strings.dart';

final injector = Injector.appInstance;

void main() {
  registerAllModules();

  runApp(MultiBlocProvider(providers: [
    BlocProvider<DashboardBloc>(
        create: (context) => injector.get<DashboardBloc>()),
    BlocProvider<CloseContainerCubit>(
        create: (context) => injector.get<CloseContainerCubit>()),
    BlocProvider<DetailsBloc>(create: (context) => injector.get<DetailsBloc>()),
    BlocProvider<DetailsFavoriteCubit>(
        create: (context) => injector.get<DetailsFavoriteCubit>()),
    BlocProvider<AddCharacterCubit>(
        create: (context) => injector.get<AddCharacterCubit>()),
    BlocProvider<EditCharacterCubit>(
        create: (context) => injector.get<EditCharacterCubit>()),
  ], child: PotterdexApp()));
}

class PotterdexApp extends StatelessWidget {
  const PotterdexApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.APP_NAME,
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: AppColors.GRYFFINDOR_PRIMARY_COLOR,
        accentColor: AppColors.GRYFFINDOR_ACCENT_COLOR,
        secondaryHeaderColor: AppColors.GRYFFINDOR_SECONDARY_COLOR,
        primaryColorLight: AppColors.GRYFFINDOR_LIGHT_COLOR,
        primaryColorDark: AppColors.GRYFFINDOR_DARK_COLOR,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DashboardPage(),
    );
  }
}
