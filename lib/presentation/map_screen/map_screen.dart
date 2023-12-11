import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../application/maps/controllers.dart';
import '../../domain/utils.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
//   Future<GoogleMapController> fd() async {
//     GoogleMapController controller =
//         await GoogleMapsController.controller.future;

//     return controller;
//   }

//   @override
//   void initState() {
//     fd();
//     // TODO: implement initState
//     GoogleMapsController.kGooglePlex = CameraPosition(
//         target: LatLng(CurrentPositions.currentLattitude.value,
//             CurrentPositions.currentLongitude.value),
//         zoom: 18,
//         tilt: 80);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
// //---- UNCOMMENT THIS BLOC TO ADD THE MARKERS TO MAP ALSO LINE 44

//     // List<LatLng> locs = List.generate(GoogleMapStates.locations.value.length,
//     //                 (index) => LatLng(GoogleMapStates.locations.value[index].lat, GoogleMapStates.locations.value[index].lng));
//     //             Set<Marker> markers=Set<Marker>();
//     //             for (int i = 0; i < locs.length; i++) {
//     //               markers.add(Marker(markerId: MarkerId(i.toString()), position: locs[i] ));

//     //             }
//     return Scaffold(
//       body: SizedBox(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         child: GoogleMap(
//           zoomControlsEnabled: false,
//           myLocationEnabled: true,
//           buildingsEnabled: false,

//           rotateGesturesEnabled: true,
//           mapType: MapType.normal,
//           // markers: markers,
//           initialCameraPosition: CameraPosition(
//             target: LatLng(CurrentPositions.currentLattitude.value,
//                 CurrentPositions.currentLongitude.value),
//             zoom: 13,
//           ),
//           onMapCreated: (GoogleMapController controller) {
//             // if (GooglemapStates.istripStarted.value)
//             controller.setMapStyle(VectorAssets.googleMapsNightConfigJson);
//             GoogleMapStates.controller.complete(controller);
//           },
//         ),
//       ),
//     );
//   }



final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   // onPressed: _goToTheLake,
      //   label: const Text('To the lake!'),
      //   icon: const Icon(Icons.directions_boat),
      // ),
    );
  }
}
// 