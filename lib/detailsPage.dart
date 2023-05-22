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
      backgroundColor: Color.fromARGB(255, 224, 226, 219),
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
          FutureBuilder<String>(
            future: _getImageUrl(item.imagePath),
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
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
              height: 550,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFF130f41),
              ),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xFF6ab04d),
                ),
                child: Column(
                  children: [
                    Text(
                      item.kingdom,
                      style: GoogleFonts.roboto(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      item.name,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF130f41)),
                    ),
                    SizedBox(height: 100),
                    Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Color(0xFFbbdc59),
                        ),
                        child: Text(
                          item.description,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.justify,
                        )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ),
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
