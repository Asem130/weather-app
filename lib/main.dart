import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/providers/weather_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(child: WeatherApp(),create: (contex){
  return WeatherProvider();
  },),
      );
}
 class WeatherApp extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Provider.of<WeatherProvider>(context).weatherData == null ? Colors.blue:Provider.of<WeatherProvider>(context).weatherData!.getColor()
      ),
      home: HomePage(),
    );
  }
}