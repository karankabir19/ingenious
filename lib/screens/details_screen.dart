// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:ingenious_minds_lab_app/model/country_data_model.dart';

class DetailsScreen extends StatefulWidget {
  final CountryData data;
  const DetailsScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.data.name),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.data.lat, widget.data.lon),
          zoom: 15,
        ),
        mapType: MapType.satellite,
        myLocationButtonEnabled: false,
        compassEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          Marker(
            markerId: const MarkerId('1'),
            position: LatLng(widget.data.lat, widget.data.lon),
          )
        },
      ),
    );
  }
}
