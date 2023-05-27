class Plant_Animal {
  final String id;
  final String name;
  final String description;
  final dynamic imagePath;
  final String onlineimgPath;
  final String kingdom;

  Plant_Animal({
    required this.id,
    required this.name,
    required this.description,
    required this.imagePath,
    required this.kingdom,
    required this.onlineimgPath,
  });

  static Plant_Animal fromMap(String id, Map<String, dynamic> data) {
    return Plant_Animal(
      id: id,
      name: data['Name'],
      description: data['Description'],
      imagePath: data['imagePath'],
      kingdom: data['Kingdom'],
      onlineimgPath: data['onlineimgPath'],
    );
  }
}
