import 'package:collectify_application/models/plantFact.dart';

class Plant {
  final String name;
  final String imagePath;
  final List<PlantFact> facts;

  Plant(this.name, this.imagePath, this.facts);

  static List<Plant> fetchAll() {
    return [
      Plant('helloplant', 'assets/fish.jpg',
          [PlantFact('how to identify', 'bljdbsjds')]),
    ];
  }
}
