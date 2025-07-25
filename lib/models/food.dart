class Food {
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final FoodCategory category;
  final List<AddOn> availableAddOns;

  Food({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.availableAddOns,
  });
}

//food categories
enum FoodCategory { burgers, salads, desserts, sides, drinks }

// add on's
class AddOn {
  final String name;
  final double price;

  AddOn({required this.name, required this.price});
}
