import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 80.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 40.0,
);

const kButtonTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 25.0,
);

const kConditionTextStyle = TextStyle(
  fontSize: 80.0,
);

const kInputaDecorationTextField = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: 'Insira uma cidade...',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(
        (10.0),
      ),
    ),
    borderSide: BorderSide.none,
  ),
);
