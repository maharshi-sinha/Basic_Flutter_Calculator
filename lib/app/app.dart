import 'package:flutter/material.dart';
import 'package:project_1/views/home_view.dart';

//stateless widget is used when the part of the user interface you are describing does not depend on anything other than the configuration information in the object itself and the BuildContext in which the widget is inflated.

//stateful widget is used when the part of the user interface you are describing can change dynamically, e.g. due to having an internal clock-driven state, or depending on some system state.

class myApp extends StatelessWidget {
  const myApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter World',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeView(),
    );
  }
}
