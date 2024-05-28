import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
part 'location_google_map_state.dart';

class LocationGoogleMapCubit extends Cubit<LocationGoogleMapState> {
  LocationGoogleMapCubit() : super(const LocationGoogleMapState());

  GoogleMapController? mapController;

  void mapCreated(GoogleMapController controller) {
    mapController = controller;
    emit(
      state.copyWith(
        mapController: controller,
      ),
    );
  }
}
