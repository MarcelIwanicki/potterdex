import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:potterdex/di/modules_initializer.dart';
import 'package:potterdex/feature/dashboard/business_logic/bloc/dashboard_bloc.dart';
import 'package:potterdex/feature/dashboard/data/repository/harry_potter_repository.dart';
import 'package:potterdex/feature/dashboard/presentation/page/dashboard_page.dart';
import 'package:injector/injector.dart';

final injector = Injector.appInstance;

void main() {
  registerAllModules();

  runApp(MultiBlocProvider(providers: [
    BlocProvider<DashboardBloc>(create: (context) => injector.get<DashboardBloc>())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PotterDex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DashboardPage(),
    );
  }
}
