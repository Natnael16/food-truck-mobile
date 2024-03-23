import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../data/models/food_truck_model.dart';

class FoodTruckDetailsBottomSheet extends StatelessWidget {
  final FoodTruck foodTruck;

  const FoodTruckDetailsBottomSheet({Key? key, required this.foodTruck})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.store, // Icon for restaurant
                    color: primaryColor,
                    size: 90),
                const SizedBox(width: 10),
                Text(
                  foodTruck.applicant ?? 'Unknown',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Facility Type: ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(width: 8),
                Text(
                  foodTruck.facilityType ?? 'Unknown',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(width: 8),
                Icon(
                  foodTruck.facilityType == 'Truck'
                      ? Icons.local_shipping
                      : Icons.shopping_cart, // Icon for facility type
                  color: foodTruck.facilityType == 'Truck'
                      ? Colors.green
                      : Colors.green,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Since ${foodTruck.approvedAt != null ? foodTruck.approvedAt!.year.toString() : 'Unknown'}',
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Food Items',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: foodTruck.foodItems
                      ?.map((item) => ListTile(
                            leading: const Icon(Icons.fastfood), // Icon for food item
                            title: Text(item,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500)),
                          ))
                      .toList() ??
                  [],
            ),
            const SizedBox(height: 16),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Working Hours',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: foodTruck.openHours?.entries.map((entry) {
                    return ListTile(
                      leading:
                          const Icon(Icons.access_time), // Icon for working hours
                      title: Text(
                        '${entry.key}: ${entry.value[0]['start_time']} - ${entry.value[0]['end_time']}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 16),
                      ),
                    );
                  }).toList() ??
                  [],
            ),
          ],
        ),
      ),
    );
  }
}
