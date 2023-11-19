import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_services.dart';

import '../models/weather_model.dart';

class SearchPage extends StatelessWidget {
        String ? cityName;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
   appBar: AppBar(),
   body: Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        onSubmitted: (data) async{
         cityName = data ;
         WeatherServices services = WeatherServices();
         WeatherModel weather = await services.GetWeatherServices(cityName: cityName!);
           Provider.of<WeatherProvider>(context,listen: false).weatherData = weather;
            Provider.of<WeatherProvider>(context,listen: false).cityName = cityName;
          
          Navigator.pop(context);
        },
          decoration: InputDecoration(
          label: Text('search'),
          border: OutlineInputBorder(),
          suffixIcon: Icon(Icons.search),
          hintText: 'Enter a city',
         contentPadding: EdgeInsets.symmetric(vertical: 25,horizontal: 12)
        ),
        
       
      ),
    ),
   ),

    );
  }
}
