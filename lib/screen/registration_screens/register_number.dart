import 'package:flutter/material.dart';
import 'package:vms_app/utils.dart/route_constants.dart';

import 'package:vms_app/utils.dart/text_styles.dart';

class RegisterNumber extends StatelessWidget {
  RegisterNumber({Key? key}) : super(key: key);
  final _formKey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    void verify() {
      if (_formKey1.currentState!.validate()) {
        _formKey1.currentState!.save();
        Navigator.of(context).pushNamed(detailPage);
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          width: double.infinity,
          child: Form(
            key: _formKey1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    "assets/images/logo.jpg",
                    width: 90,
                    height: 90,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Visitor Management System",
                  style: Styles.boldHeading,
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "Enter Mobile Number/मोबाईल नंबर टाका",
                  textAlign: TextAlign.center,
                  style: Styles.regularHeading,
                ),
                const SizedBox(
                  height: 28,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == "") {
                      return "Please enter phone number";
                    }
                    if (value!.length != 10) {
                      return "Please enter valid mobile number";
                    }
                  },
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.phone_android),
                      hintText: 'Enter Number',
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0)),
                  maxLength: 10,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (value) {
                    verify();
                  },
                  keyboardType: TextInputType.number,
                  style: Styles.regularText1,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: verify, child: const Text("Next/पुढे ")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
