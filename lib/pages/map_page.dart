import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  // Koordinat simulasi lokasi komunitas GreenLife Bandung[cite: 3, 4]
  static const LatLng _greenLifeLocation = LatLng(-6.914744, 107.609810);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lokasi Komunitas GreenLife')),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: _greenLifeLocation,
          zoom: 15, // Zoom 15 sesuai kisi-kisi[cite: 3]
        ),
        markers: {
          const Marker(
            markerId: MarkerId('greenlife_bandung'),
            position: _greenLifeLocation,
            infoWindow: InfoWindow(
              title:
                  'GreenLife Bandung', // Marker nama "GreenLife Bandung"[cite: 3]
              snippet: 'Komunitas Produk Ramah Lingkungan',
            ),
          ),
        },
      ),
    );
  }
}
