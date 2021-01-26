import 'package:climaqui/services/clima.dart';
import 'package:climaqui/telas/tela_cidade.dart';
import 'package:flutter/material.dart';
import 'package:climaqui/utils/constantes.dart';

class TelaLocalizacao extends StatefulWidget {
  TelaLocalizacao({this.locationWeather});
  final locationWeather;
  @override
  _TelaLocalizacaoState createState() => _TelaLocalizacaoState();
}

class _TelaLocalizacaoState extends State<TelaLocalizacao> {
  int temperature;
  String city;
  int condition;

  ClimaModel clima = ClimaModel();

  @override
  void initState() {
    updateUI(widget.locationWeather);
    super.initState();
  }

  void updateUI(dynamic getWeather) {
    setState(() {
      condition = getWeather['weather'][0]['id'];
      var temp = getWeather['main']['temp'];
      temperature = temp.toInt();
      city = getWeather['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/vialactea.png'),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.8),
              BlendMode.dstATop,
            ),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var weatherData = await clima.getLocalClima();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.my_location,
                      size: 50.0,
                      color: Colors.blue,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var cidadeInserida = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TelaCidade(),
                        ),
                      );
                      if (cidadeInserida != null) {
                        var climaData =
                            await clima.getCidadeByNome(cidadeInserida);
                        updateUI(climaData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperatureº',
                      style: kTempTextStyle,
                    ),
                    Text(
                      clima.getClimaIcon(condition),
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                  padding:
                      EdgeInsets.only(left: 80.0, right: 15.0, bottom: 50.0),
                  child: Text(
                    '${clima.getMensagem(temperature)} para $city!',
                    textAlign: TextAlign.right,
                    style: kMessageTextStyle,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
