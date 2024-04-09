import "dart:convert";

import "package:http/http.dart" as http;
import "package:memer_app/model/memes_response.dart";

abstract class API {
  static const String _baseUrl = "https://api.imgflip.com";

  static Future<MemeResponse> getMemes() async {
    final response = await http.get(Uri.parse('$_baseUrl/get_memes'));

    if (response.statusCode == 200) {
      // parse the Json
      final MemeResponse memeResponse = MemeResponse.fromJson(jsonDecode(response.body));
      return memeResponse;
    } else {
      throw Exception("Failed to load memes");
    }
  }
}
