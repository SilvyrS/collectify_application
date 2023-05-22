import 'detailsPage.dart';
import 'package:collectify_application/models/plantmodel.dart';
import 'app_drawer.dart';
import 'models/plantmodel.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Plant_Animal> items = [
    Plant_Animal(
        kingdom: 'Plant Kingdom',
        name: 'Thallophyta',
        description:
            'Primitive and simple body structures. The plant body is thallus, they may be filamentous, colonial, branched or unbranched. include green algae, red algae and brown algae.',
        imagePath: 'assets/Thallophyta2.jpg'),
    Plant_Animal(
        kingdom: 'Animal Kingdom',
        name: 'Arthropod',
        description:
            'Phylum of invertebrate animals (as insects, arachnids, and crustaceans) having a segmented body, jointed limbs, and a shell of chitin that is shed periodically.',
        imagePath: 'assets/arthropod.jpg'),
    Plant_Animal(
        kingdom: 'Plant Kingdom',
        name: 'Byrophytes',
        description:
            'Bryophytes are terrestrial plants but are known as “amphibians of the plant kingdom” as they require water for sexual reproduction. Bryophyta includes mosses, hornworts and liverworts.',
        imagePath: 'assets/Bryophyta2.jpg'),
    Plant_Animal(
        kingdom: 'Animal Kingdom',
        name: 'Fish',
        description:
            'Fish are aquatic vertebrate animals that have gills but lack limbs with digits, like fingers or toes. Recall that vertebrates are animals with internal backbones. Most fish are streamlined in their general body form.',
        imagePath: 'assets/fish2.jpg'),
    // Add more items as needed
  ];

  List<Plant_Animal> foundItems = [];

  void initState() {
    // at the beginning, all users are shown
    super.initState();
    foundItems.addAll(items);
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
        title: Text('Collectify', style: GoogleFonts.lobsterTwo(fontSize: 30)),
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
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisExtent: 200,
                childAspectRatio: 2 / 1,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: foundItems.length,
            itemBuilder: (BuildContext ctx, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailsPage(item: foundItems[index]),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color(0xFF6ab04d),
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          colorFilter: new ColorFilter.mode(
                              Colors.black.withOpacity(0.7), BlendMode.dstATop),
                          image: AssetImage(foundItems[index].imagePath))),
                  child: Container(
                      alignment: Alignment.center,
                      height: 85,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Color.fromARGB(131, 0, 0, 0)),
                      child: Text(
                        foundItems[index].name,
                        style: GoogleFonts.alegreyaSans(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                        textAlign: TextAlign.center,
                      )),
                ),
              );
            }),
      ),
    );
  }
}
