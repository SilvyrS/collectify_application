import 'dart:html';
import 'app_drawer.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF130f40),
        title: Text('Collectify', style: GoogleFonts.lobsterTwo(fontSize: 30)),
      ),
      body: Column(children: <Widget>[
        SearchBar(),
        GridImage(),
      ]),
      drawer: MyAppBar(context),
    );
  }

  Container SearchBar() {
    return Container(
      margin: EdgeInsets.all(20.0),
      alignment: Alignment.center,
      child: Container(
        height: 45,
        width: 300,
        child: TextField(
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
        ),
      ),
    );
  }

  //
  Container GridImage() {
    return Container(
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 10.0,
            shrinkWrap: true,
            children: <Widget>[
              Image.asset('../assets/spyrotest.png'),
              Image.asset('../assets/spyrotest.png'),
              Image.asset('../assets/spyrotest.png'),
              Image.asset('../assets/spyrotest.png'),
            ]),
      ),
    );
  }
}
