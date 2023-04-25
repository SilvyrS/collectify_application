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
      body: Column(children: <Widget>[SearchBar(), GridImage(context)]),
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

  Widget GridImage(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.all(5.0),
        children: <Widget>[
          //One List
          Container(
            height: 220,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Color.fromARGB(255, 75, 172, 75)),
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(10.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Kingdom indicator
                    Row(
                      children: [
                        SizedBox(
                          width: 150,
                          height: 60,
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Text(
                              'Plant Kingdom',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    // Main Name
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 10,
                          ),
                          child: Text(
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white),
                              'Thallophyta'),
                        )
                      ],
                    ),
                    //Description
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10.0, top: 5.0),
                          width: 200,
                          child: Expanded(
                            child: Text(
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                                'Primitive and simple body structures. The plant body is thallus, they may be filamentous, colonial, branched or unbranched. include green algae, red algae and brown algae.'),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ClipRect(
                      child: Container(
                          margin: EdgeInsets.only(left: 10.5),
                          height: 200,
                          child: Image.asset('../assets/Thallophyta2.jpg')),
                    )
                  ],
                )
              ],
            ),
          ),

          //2nd list
          Container(
            height: 220,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Color.fromARGB(255, 218, 140, 67)),
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(10.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Kingdom indicator
                    Row(
                      children: [
                        SizedBox(
                          width: 160,
                          height: 60,
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Text(
                              'Animal Kingdom',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    // Main Name
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 10,
                          ),
                          child: Text(
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white),
                              'Arthropod'),
                        )
                      ],
                    ),
                    //Description
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10.0, top: 5.0),
                          width: 200,
                          child: Expanded(
                            child: Text(
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                                'Phylum of invertebrate animals (as insects, arachnids, and crustaceans) having a segmented body, jointed limbs, and a shell of chitin that is shed periodically.'),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ClipRect(
                      child: Container(
                          margin: EdgeInsets.only(left: 10.5),
                          height: 200,
                          child: Image.asset('../assets/arthropod2.jpg')),
                    )
                  ],
                )
              ],
            ),
          ),
          //Third
          Container(
            height: 220,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Color.fromARGB(255, 75, 172, 75)),
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(10.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Kingdom indicator
                    Row(
                      children: [
                        SizedBox(
                          width: 160,
                          height: 60,
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Text(
                              'Plant Kingdom',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    // Main Name
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 10,
                          ),
                          child: Text(
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white),
                              'Bryophytes'),
                        )
                      ],
                    ),
                    //Description
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10.0, top: 5.0),
                          width: 200,
                          child: Expanded(
                            child: Text(
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                                'Bryophytes are terrestrial plants but are known as “amphibians of the plant kingdom” as they require water for sexual reproduction. Bryophyta includes mosses, hornworts and liverworts.'),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ClipRect(
                      child: Container(
                          margin: EdgeInsets.only(left: 10.5),
                          height: 200,
                          child: Image.asset('../assets/Bryophyta2.jpg')),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
