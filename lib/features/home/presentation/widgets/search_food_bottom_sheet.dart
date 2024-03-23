import 'package:flutter/material.dart';

class SearchFoodsBottomSheet extends StatefulWidget {
  const SearchFoodsBottomSheet({super.key});
  @override
  SearchFoodsBottomSheetState createState() => SearchFoodsBottomSheetState();
}

class SearchFoodsBottomSheetState extends State<SearchFoodsBottomSheet> {
  List<String> foodItems = []; // List to store food items fetched from database

  @override
  void initState() {
    super.initState();
    // Fetch food items from database
    fetchFoodItems();
  }

  // Function to fetch food items from database
  void fetchFoodItems() {
    setState(() {
      foodItems = [
        'Pizza',
        'Burger',
        'Sushi',
        'Taco',
        'Sushi',
        'Taco',
        'Sushi',
        'Taco',
        'Sushi',
        'Taco',
        'Sushi',
        'Taco',
        'Sushi',
        'Taco',
        'Sushi',
        'Taco',
        'Sushi',
        'Taco',
        'Sushi',
        'Taco',
        'Sushi',
        'Taco',
        'Sushi',
        'Taco',
        'Sushi',
        'Taco',
        'Sushi',
        'Taco',
        'Sushi',
        'Taco',
        'Sushi',
        'Taco',
        'Sushi',
        'Taco',
        'Sushi',
        'Taco',
        'Sushi',
        'Taco',
        'Sushi',
        'Taco',
        'Sushi',
        'Taco',
        'Sushi',
        'Taco',
        'Sushi',
        'Taco',
        'Sushi',
        'Taco',
        'Sushi',
        'Taco',
        'Sushi',
        'Taco',
        'Sushi',
        'Taco',
        'Sushi',
        'Taco',
        'Sushi',
        'Taco'
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header with icon and text
          ListTile(
            leading: Icon(Icons.fastfood), // Food related icon
            title: Text(
              'Food Items',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          // List of food items
          SizedBox(
            height: MediaQuery.sizeOf(context).height* 0.42,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: foodItems.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Icon(Icons.local_dining), // Food item icon
                  title: Text(foodItems[index],
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500)), // Food item name
                  onTap: () {
                    // Handle onTap event for food item
                    // You can add your logic here
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
