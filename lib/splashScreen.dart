import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 90,
          ),
          Container(
            width: 210,
            height: 210,
            child: Image.asset('assets/logo1.png'),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Collectify',
                style: GoogleFonts.roboto(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    color: Color.fromARGB(255, 37, 37, 37),
                    textStyle: TextStyle(decoration: TextDecoration.none)),
              ),
            ],
          ),
          Container(
            height: 15,
          ),
          Center(
              child: LoadingAnimationWidget.inkDrop(
                  color: Color.fromARGB(255, 71, 26, 177), size: 50)),
        ],
      ),
    );
  }
}
