import 'package:http/http.dart' as http;

const String BASE_URL = "http://hp-api.herokuapp.com";

class HarryPotterAPI {
  Future<http.Response> getRawHarryPotterCharacters() async {
    return http.get(Uri.parse("$BASE_URL/api/characters"));
  }

  Future<http.Response> getRawHarryPotterStudents() async {
    return http.get(Uri.parse("$BASE_URL/api/characters/students"));
  }

  Future<http.Response> getRawHarryPotterStaff() async {
    return http.get(Uri.parse("$BASE_URL/api/characters/staff"));
  }

  Future<http.Response> getRawHarryPotterCharactersByHouse(String house) async {
    return http.get(Uri.parse("$BASE_URL/api/characters/house/$house"));
  }
}