
import 'package:flutter/material.dart';
import 'package:marker_crud/presentation/map_screen/map_screen.dart';

import 'home_screen/view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
// home:GoogleMapScreen()
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
