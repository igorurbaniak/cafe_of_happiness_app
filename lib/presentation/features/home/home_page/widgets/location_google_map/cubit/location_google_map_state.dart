part of 'location_google_map_cubit.dart';

@immutable
class LocationGoogleMapState {
  const LocationGoogleMapState({
    required this.latitude,
    required this.longitude,
  });

  final double latitude;
  final double longitude;
}
