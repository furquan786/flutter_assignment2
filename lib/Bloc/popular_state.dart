import 'package:new_assignment/Models/PLaces/place.dart';

abstract class PopularPlacesState {}

class PopularPlacesLoading extends PopularPlacesState {}

class PopularPlacesLoaded extends PopularPlacesState {
  final List<Place> places;

  PopularPlacesLoaded(this.places);
}
