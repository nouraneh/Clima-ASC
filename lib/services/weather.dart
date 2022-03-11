import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
const apikey='1711468f502a38f928900f42930fe369';
const openWeatherMapURL='http://api.openweathermap.org/data/2.5/weather';
class WeatherModel {
  Future<dynamic> getCityWeather(String CityName)async{
    var URL = '$openWeatherMapURL?q=$CityName&appid=$apikey&units=metric';
    NetworkHelper networkHelper= NetworkHelper(URL);
    var weatherData= await networkHelper.getData();
    return weatherData;

  }
  Future <dynamic> getLocationWeather()async{
    double longitude;
    double latitude;
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=$latitude&lon=$longitude&appid=$apikey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}