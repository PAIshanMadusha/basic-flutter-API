class ProductModel {
  final int? id;
  final String category;
  final String title;
  final double price;
  final String description;
  final String image;

  ProductModel({
    this.id,
    required this.category,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
  });

  //Method to Covert the Jason Data into a ProductModel
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      category: json['category'],
      title: json['title'],
      price: json['price'].toDouble(),
      description: json['description'],
      image: json['image'],
    );
  }

  //Method to Convert Data to Json Data
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category,
    };
  }
}
