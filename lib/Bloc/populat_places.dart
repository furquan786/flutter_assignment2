import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_assignment/Bloc/popular_events.dart';
import 'package:new_assignment/Bloc/popular_state.dart';
import 'package:new_assignment/Models/PLaces/place.dart';

class PopularPlacesBloc extends Bloc<PopularPlacesEvent, PopularPlacesState> {
  PopularPlacesBloc() : super(PopularPlacesLoading()) {
    on<LoadPopularPlaces>((event, emit) async {
      await Future.delayed(Duration(seconds: 2)); // Simulating network delay
      emit(PopularPlacesLoaded([
        Place(
            name: "Mount Fuji",
            location: "Tokyo, Japan",
            rating: 4.8,
            imageUrl: "assets/images/card_img1.png"),
        Place(
            name: "Andes",
            location: "South America",
            rating: 4.7,
            imageUrl: "assets/images/card_img2.png"),
      ]));
    });
  }
}
