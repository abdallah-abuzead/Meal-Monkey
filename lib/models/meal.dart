class Meal {
  String name, type, image;
  double ratingPercentage;
  int ratingCount;

  Meal({
    required this.name,
    required this.image,
    this.type = '',
    this.ratingCount = 124,
    this.ratingPercentage = 4.9,
  });
}
