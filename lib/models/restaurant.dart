import 'package:flutter/material.dart';
import 'package:fooddelivery/models/cart_item.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';

import 'food.dart';

class Restaurant extends ChangeNotifier {
  final List<Food> _menu = [
    // burgers
    Food(
      name: 'Classic Burger',
      description: 'A juicy beef patty with lettuce, tomato, and cheese.',
      imageUrl: 'lib/images/burgers/burger1.jpg',
      price: 0.99,
      category: FoodCategory.burgers,
      availableAddOns: [
        AddOn(name: 'Extra Cheese', price: 0.52),
        AddOn(name: 'Bacon', price: 0.60),
        AddOn(name: 'Avocado', price: 0.75),
        AddOn(name: 'Grilled Mushrooms', price: 0.45),
        AddOn(name: 'Ketchup', price: 0.10),
      ],
    ),
    Food(
      name: 'BBQ Bacon Burger',
      description: 'Smoky BBQ sauce, crispy bacon, cheddar cheese.',
      imageUrl: 'lib/images/burgers/burger2.jpg',
      price: 1.29,
      category: FoodCategory.burgers,
      availableAddOns: [
        AddOn(name: 'Onion Rings', price: 0.40),
        AddOn(name: 'Extra Sauce', price: 0.30),
        AddOn(name: 'Double Patty', price: 0.85),
        AddOn(name: 'Garlic Aioli', price: 0.35),
        AddOn(name: 'Chili Flakes', price: 0.20),
      ],
    ),
    Food(
      name: 'Veggie Delight',
      description: 'Grilled plant-based patty with lettuce and vegan mayo.',
      imageUrl: 'lib/images/burgers/burger3.jpg',
      price: 1.19,
      category: FoodCategory.burgers,
      availableAddOns: [
        AddOn(name: 'Vegan Cheese', price: 0.50),
        AddOn(name: 'Pickles', price: 0.20),
        AddOn(name: 'Grilled Mushrooms', price: 0.45),
        AddOn(name: 'Garlic Aioli', price: 0.35),
        AddOn(name: 'Ketchup', price: 0.10),
      ],
    ),
    Food(
      name: 'Double Beef Burger',
      description: 'Two beef patties, double cheese, and secret sauce.',
      imageUrl: 'lib/images/burgers/burger4.jpg',
      price: 1.59,
      category: FoodCategory.burgers,
      availableAddOns: [
        AddOn(name: 'Jalapeños', price: 0.25),
        AddOn(name: 'Fried Egg', price: 0.45),
        AddOn(name: 'Grilled Mushrooms', price: 0.45),
        AddOn(name: 'Chili Flakes', price: 0.20),
        AddOn(name: 'Extra Cheese', price: 0.52),
      ],
    ),
    Food(
      name: 'Spicy Chicken Burger',
      description: 'Crispy chicken with spicy mayo and pickles.',
      imageUrl: 'lib/images/burgers/burger5.jpg',
      price: 1.39,
      category: FoodCategory.burgers,
      availableAddOns: [
        AddOn(name: 'Extra Chicken', price: 0.90),
        AddOn(name: 'Coleslaw', price: 0.35),
        AddOn(name: 'Ketchup', price: 0.10),
        AddOn(name: 'Garlic Aioli', price: 0.35),
        AddOn(name: 'Chili Flakes', price: 0.20),
      ],
    ),

    // salads
    Food(
      name: 'Caesar Salad',
      description: 'Romaine, croutons, parmesan, and Caesar dressing.',
      imageUrl: 'lib/images/salads/salad1.jpg',
      price: 0.89,
      category: FoodCategory.salads,
      availableAddOns: [
        AddOn(name: 'Grilled Chicken', price: 0.70),
        AddOn(name: 'Boiled Egg', price: 0.30),
        AddOn(name: 'Chili Flakes', price: 0.20),
        AddOn(name: 'Sunflower Seeds', price: 0.30),
        AddOn(name: 'Grilled Mushrooms', price: 0.45),
      ],
    ),
    Food(
      name: 'Greek Salad',
      description: 'Tomatoes, cucumber, olives, feta, and olive oil.',
      imageUrl: 'lib/images/salads/salad2.jpg',
      price: 0.99,
      category: FoodCategory.salads,
      availableAddOns: [
        AddOn(name: 'Pita Bread', price: 0.25),
        AddOn(name: 'Extra Feta', price: 0.40),
        AddOn(name: 'Vinaigrette Dressing', price: 0.25),
        AddOn(name: 'Chili Flakes', price: 0.20),
        AddOn(name: 'Garlic Aioli', price: 0.35),
      ],
    ),
    Food(
      name: 'Quinoa Power Bowl',
      description: 'Quinoa, chickpeas, kale, avocado, and tahini dressing.',
      imageUrl: 'lib/images/salads/salad3.jpg',
      price: 1.29,
      category: FoodCategory.salads,
      availableAddOns: [
        AddOn(name: 'Tofu', price: 0.55),
        AddOn(name: 'Hummus', price: 0.35),
        AddOn(name: 'Grilled Mushrooms', price: 0.45),
        AddOn(name: 'Sunflower Seeds', price: 0.30),
        AddOn(name: 'Boiled Egg', price: 0.30),
      ],
    ),
    Food(
      name: 'Crispy Chicken Salad',
      description: 'Mixed greens with crispy chicken strips and ranch.',
      imageUrl: 'lib/images/salads/salad4.jpg',
      price: 1.09,
      category: FoodCategory.salads,
      availableAddOns: [
        AddOn(name: 'Cheddar Shreds', price: 0.30),
        AddOn(name: 'Tomatoes', price: 0.20),
        AddOn(name: 'Chili Flakes', price: 0.20),
        AddOn(name: 'Ketchup', price: 0.10),
        AddOn(name: 'Grilled Mushrooms', price: 0.45),
      ],
    ),
    Food(
      name: 'Asian Sesame Salad',
      description: 'Cabbage, carrots, sesame seeds, and ginger dressing.',
      imageUrl: 'lib/images/salads/salad5.jpg',
      price: 0.95,
      category: FoodCategory.salads,
      availableAddOns: [
        AddOn(name: 'Mandarin Oranges', price: 0.25),
        AddOn(name: 'Toasted Almonds', price: 0.30),
        AddOn(name: 'Vinaigrette Dressing', price: 0.25),
        AddOn(name: 'Chili Flakes', price: 0.20),
        AddOn(name: 'Tofu', price: 0.55),
      ],
    ),

    // desserts
    Food(
      name: 'Chocolate Lava Cake',
      description: 'Warm chocolate cake with molten center.',
      imageUrl: 'lib/images/desserts/dessert1.jpg',
      price: 0.99,
      category: FoodCategory.desserts,
      availableAddOns: [
        AddOn(name: 'Vanilla Ice Cream', price: 0.60),
        AddOn(name: 'Sprinkles', price: 0.15),
        AddOn(name: 'Chocolate Chips', price: 0.20),
        AddOn(name: 'Caramel Sauce', price: 0.25),
        AddOn(name: 'Mini Marshmallows', price: 0.30),
      ],
    ),
    Food(
      name: 'Strawberry Cheesecake',
      description: 'Classic cheesecake topped with strawberries.',
      imageUrl: 'lib/images/desserts/dessert2.jpg',
      price: 1.09,
      category: FoodCategory.desserts,
      availableAddOns: [
        AddOn(name: 'Whipped Cream', price: 0.25),
        AddOn(name: 'Sprinkles', price: 0.15),
        AddOn(name: 'Caramel Sauce', price: 0.25),
        AddOn(name: 'Chocolate Chips', price: 0.20),
      ],
    ),
    Food(
      name: 'Churros',
      description: 'Cinnamon-sugar fried dough sticks.',
      imageUrl: 'lib/images/desserts/dessert3.jpg',
      price: 0.75,
      category: FoodCategory.desserts,
      availableAddOns: [
        AddOn(name: 'Chocolate Dip', price: 0.20),
        AddOn(name: 'Caramel Sauce', price: 0.25),
        AddOn(name: 'Mini Marshmallows', price: 0.30),
        AddOn(name: 'Sprinkles', price: 0.15),
      ],
    ),
    Food(
      name: 'Ice Cream Sundae',
      description: 'Vanilla ice cream with chocolate syrup and nuts.',
      imageUrl: 'lib/images/desserts/dessert4.jpg',
      price: 0.89,
      category: FoodCategory.desserts,
      availableAddOns: [
        AddOn(name: 'Cherry Topping', price: 0.15),
        AddOn(name: 'Whipped Cream', price: 0.25),
        AddOn(name: 'Caramel Sauce', price: 0.25),
        AddOn(name: 'Chocolate Chips', price: 0.20),
      ],
    ),
    Food(
      name: 'Brownie Bites',
      description: 'Fudgy chocolate brownie squares.',
      imageUrl: 'lib/images/desserts/dessert5.jpg',
      price: 0.69,
      category: FoodCategory.desserts,
      availableAddOns: [
        AddOn(name: 'Caramel Drizzle', price: 0.25),
        AddOn(name: 'Whipped Cream', price: 0.25),
        AddOn(name: 'Sprinkles', price: 0.15),
        AddOn(name: 'Mini Marshmallows', price: 0.30),
      ],
    ),

    // sides
    Food(
      name: 'French Fries',
      description: 'Crispy golden potato fries.',
      imageUrl: 'lib/images/sides/side1.jpg',
      price: 0.59,
      category: FoodCategory.sides,
      availableAddOns: [
        AddOn(name: 'Cheese Sauce', price: 0.30),
        AddOn(name: 'Ketchup', price: 0.10),
        AddOn(name: 'Spicy Mayo', price: 0.25),
        AddOn(name: 'Grated Parmesan', price: 0.40),
        AddOn(name: 'Chili Flakes', price: 0.20),
      ],
    ),
    Food(
      name: 'Onion Rings',
      description: 'Fried onion rings with dipping sauce.',
      imageUrl: 'lib/images/sides/side2.jpg',
      price: 0.69,
      category: FoodCategory.sides,
      availableAddOns: [
        AddOn(name: 'Spicy Mayo', price: 0.25),
        AddOn(name: 'Garlic Aioli', price: 0.35),
        AddOn(name: 'Cheese Dip', price: 0.35),
        AddOn(name: 'Ketchup', price: 0.10),
        AddOn(name: 'Ranch Dip', price: 0.25),
      ],
    ),
    Food(
      name: 'Garlic Bread',
      description: 'Buttery garlic-flavored bread slices.',
      imageUrl: 'lib/images/sides/side3.jpg',
      price: 0.49,
      category: FoodCategory.sides,
      availableAddOns: [
        AddOn(name: 'Mozzarella', price: 0.40),
        AddOn(name: 'Grated Parmesan', price: 0.40),
        AddOn(name: 'Chili Flakes', price: 0.20),
        AddOn(name: 'Garlic Aioli', price: 0.35),
        AddOn(name: 'Tomato Salsa', price: 0.25),
      ],
    ),
    Food(
      name: 'Coleslaw',
      description: 'Creamy and crunchy cabbage slaw.',
      imageUrl: 'lib/images/sides/side4.jpg',
      price: 0.39,
      category: FoodCategory.sides,
      availableAddOns: [
        AddOn(name: 'Extra Cream', price: 0.15),
        AddOn(name: 'Sunflower Seeds', price: 0.30),
        AddOn(name: 'Raisins', price: 0.20),
        AddOn(name: 'Pepper Sprinkle', price: 0.10),
      ],
    ),
    Food(
      name: 'Mozzarella Sticks',
      description: 'Fried mozzarella with marinara dip.',
      imageUrl: 'lib/images/sides/side5.jpg',
      price: 0.99,
      category: FoodCategory.sides,
      availableAddOns: [
        AddOn(name: 'Ranch Dip', price: 0.25),
        AddOn(name: 'Spicy Marinara', price: 0.30),
        AddOn(name: 'Cheese Drizzle', price: 0.35),
        AddOn(name: 'Chili Flakes', price: 0.20),
        AddOn(name: 'Garlic Aioli', price: 0.35),
      ],
    ),

    // drinks
    Food(
      name: 'Coca-Cola',
      description: 'Chilled classic Coca-Cola bottle.',
      imageUrl: 'lib/images/drinks/drink1.jpg',
      price: 0.49,
      category: FoodCategory.drinks,
      availableAddOns: [
        AddOn(name: 'Ice Cubes', price: 0.05),
        AddOn(name: 'Lemon Slice', price: 0.15),
        AddOn(name: 'Mint Leaves', price: 0.20),
        AddOn(name: 'Extra Sugar', price: 0.10),
      ],
    ),
    Food(
      name: 'Lemon Iced Tea',
      description: 'Refreshing iced tea with lemon flavor.',
      imageUrl: 'lib/images/drinks/drink2.jpg',
      price: 0.59,
      category: FoodCategory.drinks,
      availableAddOns: [
        AddOn(name: 'Mint Leaves', price: 0.20),
        AddOn(name: 'Lemon Slice', price: 0.15),
        AddOn(name: 'Honey Shot', price: 0.25),
        AddOn(name: 'Ice Cubes', price: 0.05),
      ],
    ),
    Food(
      name: 'Chocolate Milkshake',
      description: 'Creamy milkshake with chocolate syrup.',
      imageUrl: 'lib/images/drinks/drink3.jpg',
      price: 0.89,
      category: FoodCategory.drinks,
      availableAddOns: [
        AddOn(name: 'Whipped Cream', price: 0.25),
        AddOn(name: 'Chocolate Chips', price: 0.20),
        AddOn(name: 'Caramel Drizzle', price: 0.25),
        AddOn(name: 'Ice Cubes', price: 0.05),
        AddOn(name: 'Extra Syrup', price: 0.15),
      ],
    ),
    Food(
      name: 'Orange Juice',
      description: 'Freshly squeezed orange juice.',
      imageUrl: 'lib/images/drinks/drink4.jpg',
      price: 0.79,
      category: FoodCategory.drinks,
      availableAddOns: [
        AddOn(name: 'Lemon Slice', price: 0.15),
        AddOn(name: 'Ice Cubes', price: 0.05),
        AddOn(name: 'Honey Shot', price: 0.25),
        AddOn(name: 'Mint Leaves', price: 0.20),
      ],
    ),
    Food(
      name: 'Mango Smoothie',
      description: 'Sweet mango blended with yogurt.',
      imageUrl: 'lib/images/drinks/drink5.jpg',
      price: 0.99,
      category: FoodCategory.drinks,
      availableAddOns: [
        AddOn(name: 'Protein Boost', price: 0.50),
        AddOn(name: 'Chia Seeds', price: 0.30),
        AddOn(name: 'Mint Leaves', price: 0.20),
        AddOn(name: 'Ice Cubes', price: 0.05),
      ],
    ),
  ];

  /* Get the menu items */
  List<Food> get menu => _menu;

  // user cart
  final List<CartItem> _cart = [];
  List<CartItem> get cart => _cart;

  /*  
  
  operations

  */

  // add item to cart
  void addToCart(Food food, List<AddOn> selectedAddons) {
    // see if there is a cart item with the same food and seleccted addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // check if the food items are same
      bool isSameFood = item.food == food;

      // check if the list of selected addons are same
      bool isSameAddons = ListEquality().equals(
        item.selectedAddons,
        selectedAddons,
      );

      return isSameFood && isSameAddons;
    });

    // if item already exists , increase the quantity

    if (cartItem != null) {
      cartItem.quantity++;
    }
    // else, add the items to the cart
    else {
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }

    notifyListeners();
  }

  // remove item from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      _cart[cartIndex].quantity--;
    } else {
      _cart.removeAt(cartIndex);
    }
    notifyListeners();
  }

  // get total price of the cart
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (AddOn addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  // get total number of items in the cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  // clear the cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  /*

  helper methods
  
  */
  // generate a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();

    // format the date to include up to seconds only
    String formattedDate = DateFormat(
      'yyyy-MM-dd HH:mm:ss',
    ).format(DateTime.now());
    receipt.writeln(formattedDate);
    receipt.writeln("-------------");

    for (final cartItem in _cart) {
      receipt.writeln(
        "${cartItem.quantity} X ${cartItem.food.name} -- ${_formatPrice(cartItem.food.price)}",
      );

      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln("   Addons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }

    receipt.writeln("-------------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");

    return receipt.toString();
  }

  // format double value to money
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  // format list of addons into a string summary
  String _formatAddons(List<AddOn> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(", ");
  }
}
