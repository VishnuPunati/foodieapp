import 'package:flutter/material.dart';
import 'package:fooddelivery/components/my_button.dart';
import 'package:fooddelivery/components/my_cart_tile.dart';
import 'package:fooddelivery/models/restaurant.dart';
import 'package:fooddelivery/pages/payment_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurant = context.watch<Restaurant?>();
    final colorScheme = Theme.of(context).colorScheme;

    if (restaurant == null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Cart")),
        body: const Center(child: Text("Something went wrong.")),
      );
    }

    final userCart = restaurant.cart;

    if (userCart.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
          backgroundColor: Colors.transparent,
          foregroundColor: colorScheme.inversePrimary,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.shopping_cart_outlined,
                size: 100,
                color: colorScheme.primary.withOpacity(0.6),
              ),
              const SizedBox(height: 20),
              Text(
                "Your cart is empty",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: colorScheme.inversePrimary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Add something delicious!",
                style: TextStyle(
                  fontSize: 16,
                  color: colorScheme.inversePrimary.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder:
                    (context) => AlertDialog(
                      title: const Text(
                        "Are you sure you want to clear the cart?",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            restaurant.clearCart();

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Row(
                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      color: colorScheme.tertiary,
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text(
                                        'Cart cleared successfully!',
                                        style: TextStyle(
                                          color: colorScheme.tertiary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                backgroundColor: colorScheme.primary,
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 12,
                                ),
                                elevation: 10,
                                duration: const Duration(seconds: 3),
                              ),
                            );
                          },
                          child: const Text("Confirm"),
                        ),
                      ],
                    ),
              );
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Cart Items
            Expanded(
              child: ListView.builder(
                itemCount: userCart.length,
                itemBuilder: (context, index) {
                  final cartItem = userCart[index];
                  return MyCartTile(cartItem: cartItem);
                },
              ),
            ),
            // Checkout Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: MyButton(
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PaymentPage(),
                      ),
                    ),
                text: "Go to checkout",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
