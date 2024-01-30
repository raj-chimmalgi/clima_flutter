import 'location.dart';
import 'networking.dart';

const apiKey = 'a316bf6b42d8dd2a2634e57b8c727d30';
const openWeatherMapUrl = 'https://api.openweathermap.org/data/3.0/onecall';

class WeatherModel {
  Future<dynamic> getWeatherByCity(String city) async {
    NetworkHelper networkHelper = NetworkHelper(
        url: 'https://api.openweathermap.org/data/2.5/weather?q=$city'
            '&units=metric&appid=$apiKey');

    return await networkHelper.getData();
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        url: '$openWeatherMapUrl?lat=${location.latitude}&lon'
            '=${location.longitude}&units=metric&appid=$apiKey');

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
