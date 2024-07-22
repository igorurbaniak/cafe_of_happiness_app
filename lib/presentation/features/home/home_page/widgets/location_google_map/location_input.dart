import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocationGoogleMap extends StatefulWidget {
  const LocationGoogleMap({super.key});

  @override
  State<LocationGoogleMap> createState() => _LocationLocationGoogleMapState();
}

class _LocationLocationGoogleMapState extends State<LocationGoogleMap> {
  final Uri _urlGoogleMapsLocation = Uri.parse(
      'https://www.google.pl/maps/place/Manufaktura/@51.7792348,19.4423599,17z/data=!3m1!4b1!4m6!3m5!1s0x471bcb56c4119b59:0xfca7f17fec34f65b!8m2!3d51.7792315!4d19.4449348!16s%2Fm%2F0vxgttm?entry=ttu');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_urlGoogleMapsLocation)) {
      throw Exception('Could not launch $_urlGoogleMapsLocation');
    }
  }

  late GoogleMapController mapController;
  final LatLng _manufakturaLocation =
      const LatLng(51.77930448825803, 19.444913339232958);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.our_location,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              height: 200,
              width: double.infinity,
              child: GoogleMap(
                myLocationEnabled: true,
                trafficEnabled: true,
                compassEnabled: true,
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _manufakturaLocation,
                  zoom: 14,
                ),
                markers: {
                  Marker(
                    markerId: const MarkerId('Manufaktura'),
                    position: _manufakturaLocation,
                    infoWindow: const InfoWindow(title: 'Drewnowska Street 58'),
                  ),
                },
              ),
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 45,
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _launchUrl,
              icon: Icon(Icons.route_rounded,
                  color: Theme.of(context).colorScheme.onTertiaryContainer),
              label: Text(
                AppLocalizations.of(context)!.find_out_how_to_get_here,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Theme.of(context).colorScheme.onTertiary,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.grey.shade300,
                    width: 0.6,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
