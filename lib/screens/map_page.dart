import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'home_page.dart';

class MapPage extends StatefulWidget {
  final LatLng location;

  const MapPage({Key? key, required this.location}) : super(key: key);

  @override
  State<MapPage> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  late final CameraPosition _initialPosition = CameraPosition(
    target: widget.location,
    zoom: 11,
  );

  static const CameraPosition _finalPosition = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(-9.7454125, -36.6313577),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _initialPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: exit,
        label: const Text('Voltar'),
        icon: const Icon(Icons.school),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_finalPosition));
  }
    exit()  {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomePage()));
  }
}