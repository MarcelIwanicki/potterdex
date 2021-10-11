import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injector/injector.dart';
import 'package:potterdex/di/modules_initializer.dart';
import 'package:potterdex/feature/add/business_logic/add_character_cubit.dart';
import 'package:potterdex/feature/dashboard/business_logic/bloc/dashboard_bloc.dart';
import 'package:potterdex/feature/dashboard/business_logic/cubit/close_container_cubit.dart';
import 'package:potterdex/feature/dashboard/presentation/page/dashboard_page.dart';
import 'package:potterdex/feature/details/business_logic/bloc/details_bloc.dart';
import 'package:potterdex/feature/details/business_logic/cubit/details_favorite_cubit.dart';
import 'package:potterdex/feature/edit/business_logic/edit_character_cubit.dart';
import 'package:potterdex/preferences/theme_notifier.dart';
import 'package:potterdex/preferences/theme_preferences.dart';
import 'package:potterdex/resources/values/app_strings.dart';
import 'package:potterdex/resources/values/app_styles.dart';
import 'package:provider/provider.dart';

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
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer(builder: (context, ThemeNotifier themeNotifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppStrings.APP_NAME,
          theme: _getTheme(themeNotifier),
          home: DashboardPage(),
        );
      }),
    );
  }

  _getTheme(ThemeNotifier themeNotifier) {
    switch (themeNotifier.theme) {
      case PotterdexTheme.GRYFFINDOR:
        return AppStyles.gryffindorTheme;
      case PotterdexTheme.SLYTHERIN:
        return AppStyles.slytherinTheme;
      case PotterdexTheme.HUFFLEPUFF:
        return AppStyles.hufflepuffTheme;
      case PotterdexTheme.RAVENCLAW:
        return AppStyles.ravenclawTheme;
    }
  }
}
