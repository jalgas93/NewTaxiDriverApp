import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_driver/http/api_client.dart';
import 'package:taxi_driver/models/directions_model.dart';


class MapPage extends StatefulWidget {
  const MapPage({Key key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  Completer<GoogleMapController> _controllerGoogleMaps = Completer();
  GoogleMapController newGoogleMapController;

  //для polylines
  Marker origin;
  Marker destination;
  Directions info;

  @override
  void dispose() {
    // TODO: implement dispose
    newGoogleMapController.dispose();
    super.dispose();
  }

//Местоположение
  Position currentPosition;
  var geoLocator = Geolocator();

  void getCurrentPosition() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    var lastPosition = await Geolocator.getLastKnownPosition();

    currentPosition = position;
    print(currentPosition.latitude);
    print(currentPosition.longitude);

    LatLng latLngPosition = LatLng(position.longitude, position.latitude);
    print('LatLngPosition:$latLngPosition');

    newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(_kGooglePlex));

    // setState(() {
    //   currentPosition = position;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            GoogleMap(
              padding: EdgeInsets.only(top: 35),
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controllerGoogleMaps.complete(controller);
                newGoogleMapController = controller;
                getCurrentPosition();
              },
              myLocationEnabled: true,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: true,
              myLocationButtonEnabled: true,
              markers: {
                if (origin != null) origin,
                if (destination != null) destination,
              },
              polylines: {
                if (info != null)
                  Polyline(
                    polylineId: PolylineId('overview_polyline'),
                    color: Colors.red,
                    width: 5,
                    points: info.polylinePoints
                        .map((e) => LatLng(e.latitude, e.longitude))
                        .toList(),
                  ),
              },
              onLongPress: addMarker,
            ),

            //ListScreen(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('Заказать такси'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controllerGoogleMaps.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
        target: LatLng(currentPosition.latitude, currentPosition.longitude),
        zoom: 16)));
  }

  void addMarker(LatLng pos) async {
    print('Position:$pos');
    if (origin == null || (origin != null && destination != null)) {
      print('origin:$origin');
      print('origin:$destination');

      setState(() {
        origin = Marker(
            markerId: MarkerId('origin'),
            infoWindow: InfoWindow(title: 'Origin'),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
            position:
                LatLng(currentPosition.latitude, currentPosition.longitude));
        destination = null;

        //Rest info
        info = null;
      });
    } else {
      setState(() {
        destination = Marker(
            markerId: MarkerId('destination'),
            infoWindow: InfoWindow(title: 'Destination'),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
            position: pos);
      });

      //Get directions
      final directions = await ApiClient().getDirections(
        destination: destination.position,
        origin: origin.position,
      );
      setState(() {
        info = directions;
        print('Direction:$directions');
        print('Info:$info');
      });
    }
  }
}
