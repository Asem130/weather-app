import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/providers/weather_provider.dart';

import '../models/weather_model.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel? weatherModel;

  @override
  Widget build(BuildContext context) {
    weatherModel = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => SearchPage())));
                },
                icon: Icon(Icons.search))
          ],
          title: Text('Weather App'),
        ),
        body: weatherModel == null
            ? Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Center(
                    child: Text(
                        'There is no weather 🙄 , start searching now ! 🔎 ',
                        style: TextStyle(fontSize: 30))),
              )
            : Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        weatherModel!.getColor(),
                        weatherModel!.getColor()[300]!,
                        weatherModel!.getColor()[100]!,
                        weatherModel!.getColor()[50]!,
                      ]),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${Provider.of<WeatherProvider>(context).cityName}',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'updated at ${weatherModel!.date[11]}${weatherModel!.date[12]}${weatherModel!.date[13]}${weatherModel!.date[14]}',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset('${weatherModel!.getImage()}'),
                          Text(
                            '${weatherModel!.temp.toInt()}',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          Column(
                            children: [
                              Text(
                                'maxtEmp : ${weatherModel!.maxTemp.toInt()} ',
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                'mainTemp : ${weatherModel!.minTemp.toInt()}',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        '${weatherModel!.weatherStateName}',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ]),
              ));
  }
}
