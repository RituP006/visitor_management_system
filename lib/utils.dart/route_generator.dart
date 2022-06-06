import 'package:flutter/material.dart';
import 'package:vms_app/screen/registration_screens/enter_details.dart';
import 'package:vms_app/utils.dart/route_constants.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case detailPage:
        return MaterialPageRoute(builder: (_) => Details());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(
          child: Text('ERROR ROUTE'),
        ),
      );
    });
  }
}
