part of 'location_google_map_cubit.dart';

@immutable
class LocationGoogleMapState {
  const LocationGoogleMapState({this.mapController});

  final GoogleMapController? mapController;

  LocationGoogleMapState copyWith({GoogleMapController? mapController}) {
    return LocationGoogleMapState(mapController: mapController ?? this.mapController);
  }
}
