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
          RichText(
            text: TextSpan(
              text: 'Collectify is ',
              style: TextStyle(
                fontSize: 40,
                color: Colors.yellow,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.double,
              ),
              children: <TextSpan>[
                TextSpan(
                  text:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    decoration: TextDecoration.none,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
