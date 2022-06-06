import 'package:flutter/material.dart';
import 'package:vms_app/screen/registration_screens/register_number.dart';
import 'package:vms_app/screen/registration_screens/register_number.dart';
import 'package:vms_app/utils.dart/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VMS APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegisterNumber(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
