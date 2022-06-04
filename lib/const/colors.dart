import 'package:flutter/material.dart';

class CustomColors {
  static const Color primary = Color(0xFF00AEEF);

  static const MaterialColor primaryMaterial =  MaterialColor(
    0xFF00AEEF,
     <int, Color>{
      50: Color(0xff00aeef),//10%
      100: Color(0xff009dd7),//20%
      200: Color(0xff008bbf),//30%
      300: Color(0xff007aa7),//40%
      400: Color(0xff00688f),//50%
      500: Color(0xff005778),//60%
      600: Color(0xff004660),//70%
      700: Color(0xff003448),//80%
      800: Color(0xff001118),//90%
      900: Color(0xff000000),//100%
    },
  );
}