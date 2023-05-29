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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Stack(
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
                    offset: Offset(0, 125),
                    child: Center(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _buildDetails(context),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetails(BuildContext context) {
    return Positioned(
      top: 30,
      child: Container(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          height: 550,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Color(0xFF6ab04d),
              borderRadius: BorderRadius.circular(20)),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Color(0xFF30326b),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                _buildTopDetails(context),
                SizedBox(
                  height: 75,
                  width: 250,
                ),
                Text(
                  "Description",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
                Container(
                  width: 250,
                  child: Text(
                    item.description,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255)),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopDetails(BuildContext context) {
    return Column(
      children: [
        Text(
          item.name,
          style: GoogleFonts.roboto(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
        Text(
          item.name,
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255)),
        ),
        Text(
          item.name,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ],
    );
  }

  Widget _buildBotDetails(BuildContext context) {
    return Column(
      children: [
        Text(
          item.kingdom,
          style: GoogleFonts.roboto(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
        Text(
          item.name,
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255)),
        ),
        Text(
          item.genus,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255)),
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
