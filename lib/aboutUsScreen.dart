import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF130f40),
        title: Text('About Us', style: TextStyle(color: Color(0xFF7FFEBAD))),
      ),
      body: Column(
        children: [
          Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, //Center Column contents vertically,
              children: [
                Image.asset(
                  '../assets/logo1.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.contain,
                ),
                Text(
                  'Collectify',
                  style: GoogleFonts.lobsterTwo(fontSize: 60),
                ),
              ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              '../assets/color_paletter.jpg',
              width: 250,
              height: 150,
            ),
          ]),
          Container(
            color: Color(0xFFbbdc59),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(50, 20, 50, 120),
              child: RichText(
                text: TextSpan(
                  text: 'Collectify ',
                  style: TextStyle(
                    fontSize: 30,
                    color: Color(0xFF30326b),
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.double,
                  ),
                  children: <TextSpan>[
                    RichText(
                      text:
                          'is a gallery application showcasing a collection of faunas around the world.',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
