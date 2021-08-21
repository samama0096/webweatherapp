import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_weather_client/open_weather.dart';
import 'package:webweatherapp/service/sr.dart';
import 'package:webweatherapp/ui/ResultScreen.dart';

class homePage extends StatefulWidget {
  homePage({Key key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  OpenWeather openWeather =
      OpenWeather(apiKey: "09ff52deeabcd3b0377ae2fe8656d262");
  WeatherData wd;
  TextEditingController con = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double h = 50;
    double w = 200;
    @override
    void initState() {
      super.initState();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: Text("Weather App",
            style: GoogleFonts.bitter(color: Colors.white, fontSize: 22)),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              Container(
                  height: size.height * 0.5,
                  width: size.width * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[400],
                        offset: const Offset(
                          5.0,
                          5.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: Colors.white,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                    ],
                  ),
                  child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                        Spacer(),
                        Container(
                          height: size.height * 0.08,
                          width: size.width * 0.2,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey[300]),
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 1),
                            child: TextFormField(
                              controller: con,
                              decoration: InputDecoration(
                                  hintText: "Search by City!",
                                  hintStyle:
                                      TextStyle(color: Colors.grey[700])),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        AnimatedContainer(
                          curve: Curves.bounceInOut,
                          duration: Duration(milliseconds: 400),
                          height: h,
                          width: w,
                          child: Center(
                            child: ListTile(
                              onTap: () async {
                                wd = await openWeather.currentWeatherByCityName(
                                    weatherUnits: WeatherUnits.METRIC,
                                    cityName: con.text);

                                print(con.text);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (c) => resultscreen(
                                              data: wd,
                                            )));
                              },
                              trailing: Icon(
                                Icons.search_outlined,
                                color: Colors.white,
                                size: 20,
                              ),
                              title: Text(
                                "Get Info!",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              border: Border.all(color: Colors.grey[300]),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        Spacer(),
                        Text(
                          "@All rights reserved by samama 2021",
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontStyle: FontStyle.italic),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ]))),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
