import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_weather_client/open_weather.dart';

class resultscreen extends StatefulWidget {
  resultscreen({Key key, this.data}) : super(key: key);
  final WeatherData data;

  @override
  _resultscreenState createState() => _resultscreenState();
}

class _resultscreenState extends State<resultscreen> {
  @override
  Widget build(BuildContext context) {
    WeatherData wd = widget.data;

    @override
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: Text("Weather App",
            style: GoogleFonts.bitter(color: Colors.white, fontSize: 22)),
      ),
      body: Container(
        child: Center(
            child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  final temp = wd.temperature.currentTemperature;
                  final tempMin = wd.temperature.tempMin;
                  final tempMax = wd.temperature.tempMax;
                  final name = wd.name;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 70,
                      ),
                      Container(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("$temp",
                                  style: GoogleFonts.bitter(
                                    color: Colors.grey[800],
                                    fontSize: 75,
                                  )),
                              Text(
                                "CENTIGRADES",
                                style: TextStyle(
                                  color: Colors.orange,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Spacer(),
                                    Text("Min:  "),
                                    Text("$tempMin"),
                                    Spacer(),
                                    Text("Max:  "),
                                    Text("$tempMax"),
                                    Spacer(),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        height: size.height * 0.3,
                        width: size.width * 0.2,
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
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("$name",
                                  style: GoogleFonts.bitter(
                                    color: Colors.grey[800],
                                    fontSize: 30,
                                  )),
                            ],
                          ),
                        ),
                        height: size.height * 0.2,
                        width: size.width * 0.2,
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
                      ),
                    ],
                  );
                })),
      ),
    );
  }
}
