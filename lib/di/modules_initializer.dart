import 'package:potterdex/di/add_character_module.dart';
import 'package:potterdex/di/dashboard_module.dart';
import 'package:potterdex/di/details_module.dart';
import 'package:potterdex/di/repository_module.dart';

void registerAllModules() {
  registerRepositoryModule();
  registerDashobardModule();
  registerDetailsModule();
  registerAddCharacterModule();
}
