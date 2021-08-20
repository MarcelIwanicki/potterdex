import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:potterdex/di/modules_initializer.dart';
import 'package:potterdex/feature/dashboard/business_logic/bloc/dashboard_bloc.dart';
import 'package:potterdex/feature/dashboard/business_logic/cubit/close_container_cubit.dart';
import 'package:potterdex/feature/dashboard/presentation/page/dashboard_page.dart';
import 'package:injector/injector.dart';
import 'package:potterdex/resources/values/app_colors.dart';
import 'package:potterdex/resources/values/app_strings.dart';

final injector = Injector.appInstance;

void main() {
  registerAllModules();

  runApp(MultiBlocProvider(providers: [
    BlocProvider<DashboardBloc>(
        create: (context) => injector.get<DashboardBloc>()),
    BlocProvider<CloseContainerCubit>(
        create: (context) => injector.get<CloseContainerCubit>())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
