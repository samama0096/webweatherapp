import 'package:http/http.dart' as http;

class HttpService {
  static final baseUrl = "api.openweathermap.org/data/2.5/find?q=";
  static final apiKey = "&appid=09ff52deeabcd3b0377ae2fe8656d262&units=metric";
  static Future<http.Response> getRequest(endPoint) async {
    http.Response response;

    final url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/find?q=lahore&appid=09ff52deeabcd3b0377ae2fe8656d262&units=metric");

    response = await http.get(url);

    return response;
  }
}
