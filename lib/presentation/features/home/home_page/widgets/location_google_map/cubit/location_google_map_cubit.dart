import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'location_google_map_state.dart';

class LocationGoogleMapCubit extends Cubit<LocationGoogleMapState> {
  LocationGoogleMapCubit()
      : super(
          const LocationGoogleMapState(
              latitude: 51.77930448825803, longitude: 19.444913339232958),
        );
}
