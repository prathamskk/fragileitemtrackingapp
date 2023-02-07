import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

//hello
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        child: Column(
          children: [
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
                      builder: (context) => Icon(Icons.pin_drop),
                    ),
                  ],
                ),
              ],
            ))
          ],
        ),
      )),
    );
  }
}
