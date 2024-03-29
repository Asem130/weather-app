 import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather_model.dart';
class WeatherServices
{
 String baseUrl ='http://api.weatherapi.com/v1';
 String apiKey = 'c2492bd3410641b09a6144045233003';
Future<WeatherModel> GetWeatherServices({required String cityName }) async
{
Uri url = Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
http.Response response =await http.get(url);
    Map< String , dynamic > data= jsonDecode(response.body);
    
   WeatherModel weather = WeatherModel.fromJson(data);
   
     return weather;  
}
}