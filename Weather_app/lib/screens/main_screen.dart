import 'package:flutter/material.dart';
import 'package:weather/utils/weather.dart';

class MainScreen extends StatefulWidget {
  //const MainScreen({Key? key}) : super(key: key);

  final WeatherData weatherData;

  MainScreen({required this.weatherData});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int temperature;
  late Icon weatherDisplayIcon;
  late AssetImage backgroundImage;
  String? city;

  void updateDisplayInfo(WeatherData weatherData) {
    setState(() {
      temperature = weatherData.currentTemperature.round();
      WeatherDisplayData weatherDisplayData =
          weatherData.getWeatherDisplayData();
      city = weatherData.city;
      backgroundImage = weatherDisplayData.weatherImage;
      weatherDisplayIcon = weatherDisplayData.weatherIcon;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateDisplayInfo(widget.weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(image: backgroundImage, fit: BoxFit.cover),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Container(child: weatherDisplayIcon),
                const SizedBox(
                  height: 10,
                ),
                Center(
                    child: Text(
                  '$temperature °',
                  style: TextStyle(
                      color: Colors.black, fontSize: 80.0, letterSpacing: -8),
                )),
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: Text(
                  '$city',
                  style: TextStyle(
                      color: Colors.black, fontSize: 80.0, letterSpacing: -8),
                ))
              ],
            )));
  }
}
