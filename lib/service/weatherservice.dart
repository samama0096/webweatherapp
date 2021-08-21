import 'package:webweatherapp/service/service.dart';
import 'package:webweatherapp/service/weatherresponse.dart';

class WeatherService {
  static Future<List<WeatherResponse>> getWeather(String query) async {
    final response = await HttpService.getRequest(query);

    if (response.statusCode == 200) {
      final result = WeatherResponse.weatherResponseFromJson(response.body);
      return result;
    } else {
      return null;
    }
  }
}
