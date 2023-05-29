import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:google_fonts/google_fonts.dart';
import 'Dashboard.dart';
import 'models/plantmodel.dart';

class DetailsPage extends StatelessWidget {
  final item;

  DetailsPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFbbdc59),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF130f40),
        title: Text(
          'Details',
          style: GoogleFonts.lobsterTwo(fontSize: 25),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Expanded(
            child: Column(
              children: [
                Stack(
                  children: [
                    FutureBuilder<String>(
                      future: _getImageUrl(item.onlineimgPath),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Image.network(snapshot.data!);
                        } else if (snapshot.hasError) {
                          return Text('Error loading image');
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
                    ),
                    Transform.translate(
                      offset: Offset(0, 175),
                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                _buildDetails(context),
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetails(BuildContext context) {
    return Positioned(
      top: 30,
      child: Container(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          width: 300,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Color(0xFF6ab04d),
              borderRadius: BorderRadius.circular(20)),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Color(0xFF30326b),
                borderRadius: BorderRadius.circular(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildTopDetails(context),
                  SizedBox(
                    height: 20,
                  ),
                  _buildBotDetails(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopDetails(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Text(
              item.name,
              style: GoogleFonts.roboto(
                  decoration: TextDecoration.underline,
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              item.kingdom,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),
            Text(
              item.genus,
              style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBotDetails(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Scientific Name: ",
              style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),
            Text(
              item.scientificname,
              style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          "Description",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255)),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 400,
          child: Text(
            item.description,
            style: TextStyle(
                fontSize: 16, color: Color.fromARGB(255, 255, 255, 255)),
            textAlign: TextAlign.justify,
          ),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }

  Future<String> _getImageUrl(String imagePath) async {
    try {
      final ref =
          firebase_storage.FirebaseStorage.instance.ref().child(imagePath);
      return await ref.getDownloadURL();
    } catch (e) {
      print('Error getting image URL: $e');
      return '';
    }
  }
}
