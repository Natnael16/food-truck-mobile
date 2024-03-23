import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/search_bloc/search_bloc.dart';

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
  void fetchFoodItems() async {
    final dio = Dio();
    const url = "http://192.168.0.169:8000/api/foods/search/";

    final response = await dio.get(
      url,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    // Parse response
    final data = response.data['data'] as List<dynamic>;
    setState(() {
      foodItems = data.map((ob) => ob['name'] as String).toList();
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
          const ListTile(
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
            height: MediaQuery.sizeOf(context).height * 0.42,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: foodItems.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: const Icon(Icons.local_dining), // Food item icon
                  title: Text(foodItems[index],
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500)), // Food item name
                  onTap: () {
                    Navigator.pop(context);
                    BlocProvider.of<SearchBloc>(context).add(SearchFoodTruck(
                      query: foodItems[index],
                    ));
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
