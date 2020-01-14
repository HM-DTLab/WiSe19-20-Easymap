import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter polyline_points/flutter polyline_points.dart';

class Maps extends StatefulWidget {
	Maps({Key key}) : super(key: key);

	@override
		_MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  GoogleMapController mapController;
  Geolocator geolocator = Geolocator();
PolylinePoints polylinePoints = PolylinePoints();

Set<Circle> circles = {};
Set<Marker> markers = {};
Set<Polyline> polyline={};
Position courrentLoc;

  @override
  void initState() {
    super.initState();


geolocator.getPositionStream(LocationOptions(
        accuracy: LocationAccuracy.best, timeInterval: 1000))
    .listen((position) {
    setState(() {
	courrentLoc = position;
    });
      mapController?.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(position.latitude, position.longitude,
            ),
            zoom: 11.0,
          ),
        ),
      );
	// currently disabled, because "You must enable Billing on the Google Cloud Project"
	// setRoute(48.153433,  11.552753);
});


  }

void setRoute(double lat, double long) {
	LatLng dst =  LatLng(lat , long);
	List<LatLng> coordList = List();
	polylinePoints.getRouteBetweenCoordinates("AIzaSyB6FxRyiLtojo6jBV_XoVEwy4bXKIq0jHE",
			courrentLoc.latitude, courrentLoc.longitude, lat, long).then((result) {
				result.forEach((p) {coordList.add(LatLng(p.latitude, p.longitude));});
				setState(() {
						markers.clear();
						markers.add(Marker(
									markerId: MarkerId(dst.toString()),
									infoWindow: InfoWindow(title: 'Destination Name'),
									icon: BitmapDescriptor.defaultMarker,
									position: dst,
								  ));
						polyline.clear();
						polyline.add(Polyline(
									color: Colors.blue,
									polylineId: PolylineId(dst.toString()),
									visible: true,
									points: coordList,
								     ));
						});


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
				circles: circles,
			        polylines: polyline,
			        markers: markers,
                    		myLocationEnabled: true,
				initialCameraPosition: CameraPosition(
					target: LatLng(37.4219999, -122.0862462),
					zoom: 11.0,
					),
				),
			);
}
}
