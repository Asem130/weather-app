import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;
  String rise;
  String set;
  WeatherModel(
    
      {required this.date,
      required this.rise,
      required this.set,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName});

  factory WeatherModel.fromJson(dynamic json) {
    var fromJson = json['forecast']['forecastday'][0]['day'];

    return WeatherModel(
        set: json['forecast']['forecastday'][0]['astro']['sunset'],
        rise: json['forecast']['forecastday'][0]['astro']['sunrise'],
        date: json['location']['localtime'],
        temp: fromJson['avgtemp_c'],
        maxTemp: fromJson['maxtemp_c'],
        minTemp: fromJson['mintemp_c'],
        weatherStateName: fromJson['condition']['text']);
  }
  String getImage()
  {

    if (weatherStateName == 'Clear' || weatherStateName == 'LightCloud')
    {
      return 'assets/images/clear.png';
    }
    else if (weatherStateName == 'Sleet'||weatherStateName == 'Snow'||weatherStateName == 'Hail')
    {
      return 'assets/images/snow.png';
    }
    else if (weatherStateName =='Heavy Cloud'){
      return 'assets/images/cloudy.png';
        }
    else if (weatherStateName == 'Patchy rain possible'||weatherStateName == ' Light Rain' || weatherStateName == 'Heavy rain' || weatherStateName == 'Showers' || weatherStateName =='Moderate rain')
        {
               return 'assets/images/rainy.png';
        }
        else if ( weatherStateName == 'Thunderstorm' || weatherStateName == 'Thunder')
        {
    return  'assets/images/thunderstorm.png';

        }

         else
                return  'assets/images/clear.png';
   }
         
      
    MaterialColor getColor()
  {

    if (weatherStateName == 'Clear' || weatherStateName == 'LightCloud')
    {
      return Colors.orange;
    }
    else if (weatherStateName == 'Sleet'||weatherStateName == 'Snow'||weatherStateName == 'Hail')
    {
      return Colors.blue;
    }
    else if (weatherStateName =='Heavy Cloud'){
      return Colors.blueGrey;
        }
    else if (weatherStateName == ' Light Rain' ||weatherStateName == 'Patchy rain possible'|| weatherStateName == 'Heavy rain' || weatherStateName == 'Showers' || weatherStateName =='Moderate rain')
        {
               return Colors.blue;
        }
        else if ( weatherStateName == 'Thunderstorm' || weatherStateName == 'Thunder')
        {
    return Colors.grey;
        }

         else
                return  Colors.orange;
   }
         
  }    
       
  

