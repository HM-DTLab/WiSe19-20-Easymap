import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class Maps extends StatefulWidget {
	Maps({Key key}) : super(key: key);

	@override
		_MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  GoogleMapController mapController;
  Geolocator geolocator = Geolocator();

Set<Circle> circles = new Set<Circle>();


  @override
  void initState() {
    super.initState();


geolocator.getPositionStream(LocationOptions(
        accuracy: LocationAccuracy.best, timeInterval: 1000))
    .listen((position) {
	circles?.clear();
	circles?.add(Circle(circleId: CircleId("1"), center: LatLng(position.latitude, position.longitude), radius: 4000,));
      mapController?.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(position.latitude, position.longitude,
            ),
            zoom: 11.0,
          ),
        ),
      );
});


  }

	void _onMapCreated(GoogleMapController controller) {
		mapController = controller;
	}



@override
Widget build(BuildContext context) {
	return Container(
			child: GoogleMap(
				onMapCreated: _onMapCreated,
				initialCameraPosition: CameraPosition(
					target: LatLng(37.4219999, -122.0862462),
					zoom: 11.0,
					),
				),
			);
}
}
