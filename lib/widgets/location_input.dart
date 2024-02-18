import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationInformation extends StatefulWidget {
  const LocationInformation({super.key});

  @override
  State<LocationInformation> createState() => _LocationInformationState();
}

class _LocationInformationState extends State<LocationInformation> {
  final Uri _urlGoogleMapsLocation = Uri.parse(
      'https://www.google.pl/maps/place/Manufaktura/@51.7792348,19.4423599,17z/data=!3m1!4b1!4m6!3m5!1s0x471bcb56c4119b59:0xfca7f17fec34f65b!8m2!3d51.7792315!4d19.4449348!16s%2Fm%2F0vxgttm?entry=ttu');
  
  Future <void> _launchUrl() async {
    if (!await launchUrl(_urlGoogleMapsLocation)) {
      throw Exception('Could not launch $_urlGoogleMapsLocation');
    }
  }

  late GoogleMapController mapController;
  final LatLng _center = const LatLng(51.77930448825803, 19.444913339232958);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Our Location',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Column(
            children: [
              const SizedBox(height: 5),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: _center,
                      zoom: 15,
                    ),
                    markers: {
                      Marker(
                        markerId: const MarkerId('Manufaktura'),
                        position: _center,
                        infoWindow:
                            const InfoWindow(title: 'Drewnowska Street 58'),
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
                  icon: const Icon(Icons.info_outline),
                  label: const Text('Find out how to get here'),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.white,
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
        ],
      ),
    );
  }
}
