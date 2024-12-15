class Product {
  final String id;
  final String category;
  final DateTime dateListed;
  final String description;
  final String imageUrl;
  bool isFavorite;
  final String location;
  final double price;
  final String title;
  final int? area;
  final int? numberOfBathrooms;
  final int? numberOfBedrooms;

  Product({
    required this.id,
    required this.category,
    required this.dateListed,
    required this.description,
    required this.imageUrl,
    required this.isFavorite,
    required this.location,
    required this.price,
    required this.title,
    this.area,
    this.numberOfBathrooms,
    this.numberOfBedrooms,
  });

  factory Product.fromJson(String id, Map<String, dynamic> json) {
    return Product(
      id: id,
      category: json['category'] as String,
      dateListed: DateTime.parse(json['dateListed'] as String),
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      isFavorite: json['isFavorite'] as bool,
      location: json['location'] as String,
      price: (json['price'] as num).toDouble(),
      title: json['title'] as String,
      area: json['area'] as int?,
      numberOfBathrooms: json['numberOfBathrooms'] as int?,
      numberOfBedrooms: json['numberOfBedrooms'] as int?,
    );
  }
}
