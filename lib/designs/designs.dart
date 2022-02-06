import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class design {
  static Widget Txtvolk(String a, FontWeight b, double c, Color d,) {
    return Text(
      a,
      style: GoogleFonts.getFont('Vollkorn',
          textStyle: TextStyle(
            color: d,
            fontSize: c,
            letterSpacing: 1.25,
            fontStyle: FontStyle.italic,
            fontWeight: b,
          )),
    );
  }
  static Widget Txtpayton(String a, FontWeight b, double c, Color d,) {
    return Text(
      a,
      style: GoogleFonts.getFont('Paytone One',
          textStyle: TextStyle(
            color: d,
            fontSize: c,
            letterSpacing: 1.25,

            fontWeight: b,
          )),
    );
  }
  static BoxDecoration boxdec() {
    return BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color : Color.fromRGBO(224, 242, 254, 0.9),

      boxShadow : [BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.25),
          offset: Offset(0,4),
          blurRadius: 4
      )],

    );
  }
}
