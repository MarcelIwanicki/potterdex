import 'dart:convert';

import 'package:potterdex/feature/dashboard/data/dataprovider/harry_potter_api.dart';
import 'package:potterdex/feature/dashboard/data/model/harry_potter_character.dart';

class HarryPotterCharactersRepository {
  final HarryPotterAPI _harryPotterAPI;

  HarryPotterCharactersRepository(this._harryPotterAPI);

  Future<List<HarryPotterCharacter>> getHarryPotterCharacters() async {
    final response = await _harryPotterAPI.getRawHarryPotterCharacters();

    if (response.statusCode == 200) {
      return _parseCharacters(response.body);
    } else {
      throw Exception("Failed to load Harry Potter entities");
    }
  }

  List<HarryPotterCharacter> _parseCharacters(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<HarryPotterCharacter>(
            (json) => HarryPotterCharacter.fromJson(json))
        .toList();
  }
}
