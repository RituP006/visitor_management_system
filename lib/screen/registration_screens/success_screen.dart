import 'package:flutter/material.dart';
import 'package:vms_app/utils.dart/text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("VMS"),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/success.png",
                width: 50,
                height: 50,
              ),
              const Text(
                "Registration Successful!",
                style: Styles.boldHeading,
              ),
              const SizedBox(
                height: 3,
              ),
              const Text(
                "Thankyou!",
                style: Styles.boldHeading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
