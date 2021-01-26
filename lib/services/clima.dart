import 'localizacao.dart';
import 'networking.dart';

const openWeatherUrl = 'http://api.openweathermap.org/data/2.5/weather';
const apiKey = '8b555328cd72a4d8abeb070e965abfc5';

class ClimaModel {
  Future<dynamic> getCidadeByNome(String nomeCidade) async {
    var url = '$openWeatherUrl?q=$nomeCidade&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocalClima() async {
    Localizacao localizacao = Localizacao();
    await localizacao.getLocalizacao();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherUrl?lat=${localizacao.lat}&lon=${localizacao.lng}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getClimaIcon(int condicao) {
    if (condicao < 300) {
      return '🌩';
    } else if (condicao < 400) {
      return '🌧';
    } else if (condicao < 600) {
      return '☔️';
    } else if (condicao < 700) {
      return '☃️';
    } else if (condicao < 800) {
      return '🌫';
    } else if (condicao == 800) {
      return '☀️';
    } else if (condicao <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMensagem(int temp) {
    if (temp > 25) {
      return 'É hora de 🍦';
    } else if (temp > 20) {
      return 'Tempo de calções e 👕';
    } else if (temp < 10) {
      return 'Vais precisar de 🧣 e 🧤';
    } else {
      return 'Leva um 🧥 por precaução';
    }
  }
}
