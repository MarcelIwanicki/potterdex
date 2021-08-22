import 'package:floor/floor.dart';
import 'package:potterdex/feature/dashboard/data/model/harry_potter_character.dart';
import 'package:potterdex/feature/dashboard/data/repository/local/local_harry_potter_characters_dao.dart';

@Database(version: 1, entities: [HarryPotterCharacter])
abstract class LocalHarryPotterCharactersDatabase extends FloorDatabase {
  LocalHarryPotterCharactersDao get dao;
}
