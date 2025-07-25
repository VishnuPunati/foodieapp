import 'package:flutter/material.dart';
import 'package:fooddelivery/components/my_current_location.dart';
import 'package:fooddelivery/components/my_description_box.dart';
import 'package:fooddelivery/components/my_drawer.dart';
import 'package:fooddelivery/components/my_food_tile.dart';
import 'package:fooddelivery/components/my_sliver_app_bar.dart';
import 'package:fooddelivery/components/my_tab_bar.dart';
import 'package:fooddelivery/models/food.dart';
import 'package:fooddelivery/models/restaurant.dart';
import 'package:fooddelivery/pages/food_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  //tab controller
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: FoodCategory.values.length, // number of tabs
      vsync: this, // required for TabController
    );
  }

  @override
  void dispose() {
    _tabController.dispose(); // dispose the tab controller
    super.dispose();
  }

  //sort out and return a list of food items that belong to a specific category
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    // This function should filter the food items based on the category
    return fullMenu.where((food) => food.category == category).toList();
  }

  //return list of foods in given category
  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);
      return ListView.builder(
        itemCount: categoryMenu.length,
        padding: EdgeInsets.all(0),
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          // get individual food
          final food = categoryMenu[index];

          // return each food
          return MyFoodTile(
            food: food,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FoodPage(food: food)),
              );
            },
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder:
            (context, innerBoxIsScrolled) => [
              MySliverAppBar(
                title: MyTabBar(tabController: _tabController),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Divider(
                      indent: 25,
                      endIndent: 25,
                      color: Theme.of(context).colorScheme.secondary,
                    ),

                    // my currentt location
                    MyCurrentLocation(),
                    // description box
                    MyDescriptionBox(),
                  ],
                ),
              ),
            ],
        body: Consumer<Restaurant>(
          builder:
              (context, resturant, child) => TabBarView(
                controller: _tabController,
                children: getFoodInThisCategory(resturant.menu),
              ),
        ),
      ),
    );
  }
}
