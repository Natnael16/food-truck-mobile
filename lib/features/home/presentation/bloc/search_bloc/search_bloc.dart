import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/datasource/search_food_truck_datasource.dart';
import '../../../data/models/food_truck_model.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchFoodTruck>((event, emit) async {
      emit(SearchLoading());
      final searchFoodTruckDataSource = SearchFoodTruckDataSourceImpl();
      final result = await searchFoodTruckDataSource.searchFoodTruck(
          query: event.query,
          isAvailable: event.isAvailable,
          isTruck: event.isTruck,
          radius: event.radius,
          latitude: event.latitude,
          longitude: event.longitude);
      result.fold(
        (failure) => emit(SearchFailure()),
        (foodTrucks) => emit(SearchSuccess(foodTrucks: foodTrucks)),
      );
    });
  }
}
