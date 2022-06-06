import 'package:flutter/material.dart';

import 'package:vms_app/screen/registration_screens/enter_details.dart';
import 'package:vms_app/screen/registration_screens/otp_verification_screen.dart';
import 'package:vms_app/screen/registration_screens/register_number.dart';
import 'package:vms_app/screen/registration_screens/success_screen.dart';
import 'package:vms_app/utils.dart/route_constants.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case registerNumber:
        return MaterialPageRoute(builder: (_) => RegisterNumber());

      case detailPage:
        return MaterialPageRoute(builder: (_) => Details());

      case otpPage:
        return MaterialPageRoute(builder: (_) => Verification());

      case successPage:
        return MaterialPageRoute(builder: (_) => HomeScreen());

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
