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
          Row()
        ],
      ),
    );
  }
}
