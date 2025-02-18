import 'package:cloud_firestore/cloud_firestore.dart';

import 'detailsPage.dart';
import 'package:collectify_application/models/plantmodel.dart';
import 'app_drawer.dart';
import 'models/plantmodel.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class plantKingdomScreen extends StatefulWidget {
  plantKingdomScreen({super.key});

  @override
  State<plantKingdomScreen> createState() => _plantKingdomScreenState();
}

class _plantKingdomScreenState extends State<plantKingdomScreen> {
  final CollectionReference _plantAnimalCollection =
      FirebaseFirestore.instance.collection('plants');

  List<Plant_Animal> items = [];
  List<Plant_Animal> foundItems = [];

  void initState() {
    // at the beginning, all users are shown
    super.initState();
    fetchItems();
  }

  Future<void> fetchItems() async {
    final snapshot = await _plantAnimalCollection.get();
    final List<Plant_Animal> fetchedItems = snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return Plant_Animal.fromMap(doc.id, data);
    }).toList();

    setState(() {
      items = [...fetchedItems];
      foundItems = items;
    });
  }

  void filterItems(String query) {
    query = query.toLowerCase();
    setState(() {
      foundItems = items
          .where((item) =>
              item.name.toLowerCase().contains(query) ||
              item.kingdom.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF130f40),
        title:
            Text('Plant Kingdom', style: GoogleFonts.lobsterTwo(fontSize: 30)),
      ),
      body: Column(children: <Widget>[SearchBar(), gridMage(context)]),
      drawer: MyAppBar(context),
    );
  }

  Widget SearchBar() {
    return Column(
      children: [
        Container(
          margin:
              EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0, bottom: 5.0),
          alignment: Alignment.center,
          child: Container(
            height: 45,
            width: 300,
            child: TextField(
              onChanged: (value) => filterItems(value),
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    width: 3,
                    color: Color(0xFFBBD85D),
                  )),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    width: 3,
                    color: Color(0xFFBBD85D),
                  )),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  hintText: 'Search',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            ),
          ),
        ),
      ],
    );
  }

  Widget gridMage(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 170,
              childAspectRatio: 2 / 1,
              crossAxisSpacing: 20,
              mainAxisSpacing: 5),
          itemCount: foundItems.length,
          itemBuilder: (BuildContext ctx, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(item: foundItems[index]),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 5, offset: Offset(2, 5))
                  ],
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(5),
                            width: 140,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage(foundItems[index].imagePath)),
                            ),
                            child: Container(
                              margin: EdgeInsets.only(top: 125),
                              child: Text(
                                foundItems[index].name,
                                style: GoogleFonts.roboto(
                                    color: Color(0xFF130f40),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
