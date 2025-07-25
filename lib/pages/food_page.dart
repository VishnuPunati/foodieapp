import 'package:flutter/material.dart';
import 'package:fooddelivery/components/my_button.dart';
import 'package:fooddelivery/models/food.dart';
import 'package:fooddelivery/models/restaurant.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class FoodPage extends StatefulWidget {
  final Food food;
  final Map<AddOn, bool> selectedAddons = {};

  FoodPage({super.key, required this.food}) {
    for (AddOn addon in food.availableAddOns) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  // add to cart
  void addToCart(Food food, Map<AddOn, bool> selectedAddons) {
    // close the current food page and go back to menu
    Navigator.pop(context);

    // format the selectedAddons
    List<AddOn> currentlySelectedAddons = [];

    for (AddOn addOn in widget.food.availableAddOns) {
      if (widget.selectedAddons[addOn] == true) {
        currentlySelectedAddons.add(addOn);
      }
    }

    // add to cart
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // scaffold
        Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // food image
                  Image.asset(
                    widget.food.imageUrl,
                    width: double.infinity,
                    height:
                        MediaQuery.of(context).size.height *
                        0.4, // 50% of screen height
                    fit: BoxFit.cover,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // food name
                        Text(
                          widget.food.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),

                        Text(
                          '\$${widget.food.price.toString()}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),

                        const SizedBox(height: 10),

                        // food description
                        Text(widget.food.description),

                        const SizedBox(height: 10),

                        // Add-ons title
                        Text(
                          "Available Add-ons",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Divider(color: Theme.of(context).colorScheme.secondary),

                        const SizedBox(height: 10),

                        // Add-ons list
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: widget.food.availableAddOns.length,
                            itemBuilder: (context, index) {
                              final AddOn addon =
                                  widget.food.availableAddOns[index];
                              return CheckboxListTile(
                                title: Text(addon.name),
                                subtitle: Text(
                                  '\$${addon.price.toString()}',
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                value: widget.selectedAddons[addon],
                                onChanged: (bool? value) {
                                  setState(() {
                                    widget.selectedAddons[addon] = value!;
                                  });
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  // button to cart
                  MyButton(
                    text: 'Add to cart',
                    onTap: () => addToCart(widget.food, widget.selectedAddons),
                  ),

                  SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ),

        // back buttton
        Opacity(
          opacity: 0.6,
          child: SafeArea(
            child: Container(
              margin: EdgeInsets.only(left: 20, top: 20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.secondary,
              ),

              child: IconButton(
                icon: Icon(Icons.arrow_back_ios_rounded),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
