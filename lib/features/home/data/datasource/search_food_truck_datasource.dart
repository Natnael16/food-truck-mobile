import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failures.dart';
import '../models/food_truck_model.dart';

abstract class SearchFoodTruckDataSource {
  Future<Either<Failure, List<FoodTruck>>> searchFoodTruck(
      {String? query,
      bool? isAvailable,
      bool? isTruck,
      double? radius,
      double? latitude,
      double? longitude});
}

class SearchFoodTruckDataSourceImpl implements SearchFoodTruckDataSource {
  final dio = Dio();
  final _baseUrl =
      'http://192.168.0.169:8000/api'; //! subject to change on deployment

  @override
  Future<Either<Failure, List<FoodTruck>>> searchFoodTruck(
      {String? query,
      bool? isAvailable,
      bool? isTruck,
      double? radius,
      double? latitude,
      double? longitude}) async {
    try {
      // Formulate the URL with query parameters
      final url = '$_baseUrl/foodtruck/search/';
      final queryParams = <String, dynamic>{
        'q': query,
        'status': isAvailable == null
            ? null
            : isAvailable
                ? "APPROVED"
                : "",
        'facility_type': isTruck == null
            ? null
            : isTruck
                ? "Truck"
                : "Push Cart",
        'latitude': latitude?.toString(),
        'radius': radius?.toString(),
        'longitude': longitude?.toString(),
      };
      queryParams.removeWhere((key, value) => value == null);

      // Make HTTP GET request using Dio
      final response = await dio.get(
        url,
        queryParameters: queryParams,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      // Parse response
      final data = response.data['data'] as List<dynamic>;
      final List<FoodTruck> foodTrucks =
          data.map((e) => FoodTruck.fromJson(e)).toList();
      return Right(foodTrucks);
    } catch (e) {
      print('Error: $e');
      return Left(ServerFailure('Failed to fetch food trucks: $e'));
    }
  }
}
