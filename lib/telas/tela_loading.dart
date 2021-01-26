import 'package:climaqui/services/clima.dart';
import 'package:climaqui/services/networking.dart';
import 'package:climaqui/telas/tela_localizacao.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:climaqui/services/localizacao.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class TelaLoading extends StatefulWidget {
  @override
  _TelaLoadingState createState() => _TelaLoadingState();
}

class _TelaLoadingState extends State<TelaLoading> {
  @override
  void initState() {
    super.initState();
    getPosData();
  }

  void getPosData() async {
    ClimaModel climaModel = ClimaModel();
    var weatherData = await climaModel.getLocalClima();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TelaLocalizacao(
          locationWeather: weatherData,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.pink,
          size: 100.0,
        ),
      ),
    );
  }
}
