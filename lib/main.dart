import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'application/maps/controllers.dart';
import 'domain/utils.dart';
import 'presentation/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(LocationAdapter());
  await Hive.openBox<Location>('locationBox');
  
  await Geolocator.requestPermission();

  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  CurrentPositions.currentLattitude.value = position.latitude;
  CurrentPositions.currentLongitude.value = position.longitude;

  runApp(const MyApp());
}
