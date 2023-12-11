
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/utils.dart';
abstract class GoogleMapsController {
  static Completer<GoogleMapController> controller = Completer();
  static CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(CurrentPositions.currentLattitude.value,
        CurrentPositions.currentLongitude.value),
    zoom: 13,
  );
}

abstract class CurrentPositions {
  static ValueNotifier<double> currentLattitude = ValueNotifier(0);
  static ValueNotifier<double> currentLongitude = ValueNotifier(0);
  static ValueNotifier<String> currentLocationName = ValueNotifier("");
}
abstract class GoogleMapStates{
    static ValueNotifier<List<Location>> locations = ValueNotifier([]);
      static Completer<GoogleMapController> controller = Completer();


}
List<Location> getLocations() {
    final box = Hive.box<Location>('locationBox');
    return box.values.toList();
  }
