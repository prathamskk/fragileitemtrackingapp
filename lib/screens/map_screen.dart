import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:fragileitemtrackingapp/services/auth_methods.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomBar(),
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
                            Marker(
                              point: LatLng(19.046957, 72.911960),
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

var _textStyleGrey = new TextStyle(fontSize: 12.0, color: Colors.grey);

Widget _bottomBar() {
  return Container(
    alignment: Alignment.center,
    height: 49.5,
    child: Column(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 1.0,
              color: Colors.grey.withOpacity(0.7),
            ),
            Padding(
                padding: EdgeInsets.only(bottom: 0.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('LOGOUT', style: _textStyleGrey),
                    Container(
                      child: TextButton(
                        onPressed: () async {
                          await AuthMethods().signOut();
                        },
                        child: Text('LOGOUT', style: _textStyleGrey),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ],
    ),
  );
}
