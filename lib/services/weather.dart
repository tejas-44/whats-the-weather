
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

class WeatherModel {

  Future <dynamic> getCityWeather(String cityName) async {

    NetworkHelper helper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=e044b4010a00b3c5e25ac54a91118658&units=metric');
    var weatherData = await helper.getData();
    return weatherData;
  }

  Future <dynamic> getLocationWeather() async{
  Location location = Location();
  await location.getCurrentLocation();
  NetworkHelper helper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=e044b4010a00b3c5e25ac54a91118658&units=metric');
  var weatherData = await helper.getData();
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