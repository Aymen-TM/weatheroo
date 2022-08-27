class Weather {
  var dt;
  var dtTxt;
  var weatherMain;
  var weatherDescription;
  var weatherIcon;
  var temp;
  var feelsLike;
  var tempMin;
  var tempMax;
  var pressure;
  var humidity;
  var seaLevel;
  var groundLevel;
  var windSpeed;
  var windDirection;
  var clouds;
  var country;
  var sunRise;
  var sunSet;
  var timeZone;
  var name;
  var cod;
  var error;
  var img;
  Weather(
      {required this.dt,
      this.dtTxt,
      required this.weatherMain,
      required this.weatherDescription,
      required this.weatherIcon,
      required this.temp,
      required this.feelsLike,
      required this.tempMin,
      required this.tempMax,
      required this.pressure,
      required this.humidity,
      this.seaLevel,
      this.groundLevel,
      required this.windSpeed,
      this.windDirection,
      required this.clouds,
      required this.country,
      required this.sunRise,
      required this.sunSet,
      required this.timeZone,
      required this.name,
      required this.cod,
      this.error,
      this.img});

  factory Weather.fromJSON(Map<String, dynamic> parsedJSON) {
    return Weather(
      dt: parsedJSON['dt'],
      weatherMain: parsedJSON['weather'][0]['main'],
      weatherDescription: parsedJSON['weather'][0]['description'],
      weatherIcon: parsedJSON['weather'][0]['icon'],
      temp: parsedJSON['main']['temp'].toString(),
      feelsLike: parsedJSON['main']['feelslike'].toString(),
      tempMin: parsedJSON['main']['tempmin'].toString(),
      tempMax: parsedJSON['main']['tempmax'].toString(),
      pressure: parsedJSON['main']['pressure'].toString(),
      humidity: parsedJSON['main']['humidity'].toString(),
      windSpeed: parsedJSON['wind']['speed'].toString(),
      clouds: parsedJSON['clouds']['all'].toString(),
      country: parsedJSON['sys']['country'],
      sunRise: parsedJSON['sys']['sunrise'],
      sunSet: parsedJSON['sys']['sunset'],
      timeZone: parsedJSON['timezone'],
      name: parsedJSON['name'],
      cod: parsedJSON['cod'].toString(),
    );
  }

  String getWeatherImage(String weather) {
    switch (weather) {
      case "Rain":
        {
          return "assets/rainy.png";
        }

      case "Snow":
        {
          return "assets/snow.png";
        }
        break;

      case "Thunderstorm":
        {
          return "assets/thunder.png";
        }
        break;
        ;

      default:
        {
          return "assets/sunny.png";
        }
        break;
    }
  }
}
