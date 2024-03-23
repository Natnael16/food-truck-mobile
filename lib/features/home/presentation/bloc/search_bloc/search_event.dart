part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchFoodTruck extends SearchEvent {
  final String? query;
  final bool? isTruck;
  final bool? isAvailable;
  final double? latitude;
  final double? longitude;
  final double? radius;
  
  const SearchFoodTruck(
      {this.query,
      this.isTruck,
      this.isAvailable,
      this.latitude,
      this.longitude,
      this.radius});
   
}
