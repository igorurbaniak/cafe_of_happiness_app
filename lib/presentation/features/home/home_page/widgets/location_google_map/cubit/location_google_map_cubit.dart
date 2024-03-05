import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'location_google_map_state.dart';

class LocationGoogleMapCubit extends Cubit<LocationGoogleMapState> {
  LocationGoogleMapCubit() : super(LocationGoogleMapState());
}
