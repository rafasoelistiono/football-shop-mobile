import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(
  json.decode(str).map((x) => ProductEntry.fromJson(x)),
);

String productEntryToJson(List<ProductEntry> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
  String id;
  String name;
  String description;
  String category;
  String thumbnail;
  int salesCount;
  int stock;
  int price;
  double rating;
  bool isFeatured;
  int userId;

  ProductEntry({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.thumbnail,
    required this.salesCount,
    required this.stock,
    required this.price,
    required this.rating,
    required this.isFeatured,
    required this.userId,
  });

  factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    category: json["category"],
    thumbnail: json["thumbnail"],
    salesCount: json["sales_count"],
    stock: json["stock"],
    price: json["price"],
    rating: json["rating"],
    isFeatured: json["is_featured"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "category": category,
    "thumbnail": thumbnail,
    "sales_count": salesCount,
    "stock": stock,
    "price": price,
    "rating": rating,
    "is_featured": isFeatured,
    "user_id": userId,
  };
}
