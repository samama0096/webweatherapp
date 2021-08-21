import 'package:weather/weather.dart';

class Sr {
  static Future getData() async {
    WeatherFactory wf = new WeatherFactory("09ff52deeabcd3b0377ae2fe8656d262");

    final res = await wf.currentWeatherByCityName("lahore");
    return res;
  }
}
