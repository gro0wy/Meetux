import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meetux/model/event.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:location/location.dart';


class MapView extends StatefulWidget {
  final Event event;
  MapView(this.event);

  @override
  _MapViewState createState() => _MapViewState();
}



class _MapViewState extends State<MapView> {
  GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        appBar: AppBar(
          title: Text('Event Location'),
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: LatLng(widget.event.geopoint.latitude, widget.event.geopoint.longitude), zoom: 15),
              trackCameraPosition: true,
              myLocationEnabled: true,
              onMapCreated: _onMapCreated
            ),
            Positioned(
                bottom: 50,
                right: 10,
                child: FloatingActionButton(
                    child: Icon(
                      Icons.pin_drop,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    backgroundColor: Colors.white,
                    onPressed: () => _addMarker()))
          ],
        ));
  }





  _addMarker() {
    String placeName = widget.event.name;
    var marker = MarkerOptions(
        position: mapController.cameraPosition.target,
        icon: BitmapDescriptor.defaultMarker,
        infoWindowText: InfoWindowText('$placeName','Press GoogleMaps icon to see on GoogleMaps')
    );

    mapController.addMarker(marker);
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }
}
