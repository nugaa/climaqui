import 'package:climaqui/utils/constantes.dart';
import 'package:flutter/material.dart';

class TelaCidade extends StatefulWidget {
  @override
  _TelaCidadeState createState() => _TelaCidadeState();
}

class _TelaCidadeState extends State<TelaCidade> {
  String nomeCidade;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/clima.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  onChanged: (value) {
                    nomeCidade = value;
                  },
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: kInputaDecorationTextField,
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context, nomeCidade);
                },
                child: Text(
                  'Obter Clima',
                  style: kButtonTextStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
