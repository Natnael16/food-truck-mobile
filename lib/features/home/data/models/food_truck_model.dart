import 'package:google_maps_flutter/google_maps_flutter.dart';

class FoodTruck {
  static const List<String> statusChoices = [
    'APPROVED',
    'SUSPENDED',
    'REQUESTED',
    'EXPIRED'
  ];
  static const List<String> facilityTypeChoices = [
    'Truck',
    'Push Cart',
    'Unknown'
  ];

  String? applicant;
  String? facilityType;
  String? locationDescription;
  String? address;
  String? status;
  List<String>? foodItems;
  DateTime? approvedAt;
  LatLng? location;
  Map<String, dynamic>? openHours;

  FoodTruck({
    this.applicant,
    this.facilityType,
    this.locationDescription,
    this.address,
    this.status,
    this.foodItems,
    this.approvedAt,
    this.location,
    this.openHours,
  });

  factory FoodTruck.fromJson(Map<String, dynamic> json) {
    return FoodTruck(
      applicant: json['applicant'],
      facilityType: json['facility_type'],
      locationDescription: json['location_description'],
      address: json['address'],
      status: json['status'],
      foodItems: List<String>.from(json['food_items']),
      approvedAt: json['approved_at'] != null
          ? DateTime.parse(json['approved_at'])
          : null,
      location: LatLng(json['location']['coordinates'][1],
          json['location']['coordinates'][0]),
      openHours: json['open_hours'],
    );
  }
}
