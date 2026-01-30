class Car {
  final String id;
  final String imageUrl;
  final String title;
  final String subtitle;
  final String price;
  final String originalPrice;
  bool isFavorite;

  Car({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.originalPrice,
    this.isFavorite = false,
  });
}
