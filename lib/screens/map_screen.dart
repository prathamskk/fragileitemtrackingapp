import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  Position? _position;

  void _getCurrentLocation() async {
    Position position = await _determinePosition();
    setState((){
      _position = position;
    });
  }

  Future<Position> _determinePosition() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();

    if(permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied) {
        return Future.error('Location Permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
          child: Column(
            children: [
              Center(
                child: _position != null ? Text('Current Location: $_position') : const Text('No Location Data'),

              ),
              Flexible(
                  child: FlutterMap(
                options: MapOptions(center: LatLng(19.0760, 72.8777), zoom: 8),
                children: [
                  TileLayer(
                    urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                    userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: LatLng(19.044876, 73.079747),
                        width: 80,
                        height: 80,
                        builder: (context) => const Icon(Icons.pin_drop),
                      ),
                      Marker(
                        point: LatLng(19.046957, 72.911960),
                        width: 80,
                        height: 80,
                        builder: (context) => const Icon(Icons.pin_drop),
                      ),
                        _position != null ? Marker(
                        point: LatLng( _position!.latitude, _position!.longitude),
                        width: 80,
                        height: 80,
                        builder: (context) => const Icon(Icons.pin_drop),
                      ):
                        Marker(
                          point: LatLng(0,0),
                          width: 80,
                          height: 80,
                          builder: (context) => const Icon(Icons.pin_drop),
                        ),
                    ],
                  ),
                ],
              ))
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: _getCurrentLocation,
        tooltip: 'Get current location',
        child: const Icon(Icons.add),
      ),
    );
  }
}