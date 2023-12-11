import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../application/maps/controllers.dart';
import '../../domain/utils.dart';
import '../map_screen/map_screen.dart';

class HomePage extends StatelessWidget {
  final TextEditingController latController = TextEditingController();
  final TextEditingController lngController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD Location Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                var valu = getLocations();
                if (valu.length != 0) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return GoogleMapScreen();
                    },
                  ));
                }
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue),
                child: Text(
                  "Go to Map",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            TextFormField(
                controller: latController,
                decoration: InputDecoration(labelText: 'Latitude')),
            TextFormField(
                controller: lngController,
                decoration: InputDecoration(labelText: 'Longitude')),
            ElevatedButton(
              onPressed: () => addLocation(context),
              child: Text('Add Location'),
            ),
            Expanded(child: buildLocationList()),
          ],
        ),
      ),
    );
  }

  Widget buildLocationList() {
    return WatchBoxBuilder(
      box: Hive.box<Location>('locationBox'),
      builder: (context, box) {
        return ListView.builder(
          itemCount: box.length,
          itemBuilder: (context, index) {
            final location = box.getAt(index) as Location;
            return ListTile(
              title:
                  Text('Latitude: ${location.lat}, Longitude: ${location.lng}'),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () =>
                    deleteLocation(context, location, index, box.length),
              ),
            );
          },
        );
      },
    );
  }

  void addLocation(BuildContext context) {
    final box = Hive.box<Location>('locationBox');
    final lat = double.parse(latController.text);
    final lng = double.parse(lngController.text);

    final newLocation = Location(
        key: DateTime.now().millisecondsSinceEpoch, lat: lat, lng: lng);
    box.add(newLocation);
    GoogleMapStates.locations.value.add(newLocation);

    // Clear text fields
    latController.clear();
    lngController.clear();
  }
}

void deleteLocation(
    BuildContext context, Location location, int index, int len) {
  print(len);
  print(index.toString());
  final box = Hive.box<Location>('locationBox');
  if (len == 1) {
    box.clear();
  }
  box.deleteAt(box.keyAt(box.values.toList().indexOf(location)));
}
