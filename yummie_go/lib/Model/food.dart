class Food {
  final int id;
  final String name;
  final String image;
  final int price;

  Food({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: json['price'],
    );
  }
}
