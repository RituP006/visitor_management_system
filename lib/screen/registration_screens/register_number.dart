import 'package:flutter/material.dart';
import 'package:vms_app/utils.dart/route_constants.dart';

import 'package:vms_app/utils.dart/text_styles.dart';

class RegisterNumber extends StatelessWidget {
  RegisterNumber({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("VMS APP"),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          width: double.infinity,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Enter Mobile Number/मोबाईल नंबर टाका",
                  textAlign: TextAlign.center,
                  style: Styles.boldHeading,
                ),
                const SizedBox(
                  height: 28,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.length != 10) {
                      return "Please Enter Valid Mobile number";
                    }
                  },
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.phone_android),
                      hintText: 'Number',
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0)),
                  style: Styles.buttonTextBlack,
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        Navigator.of(context).pushNamed(detailPage);
                      }
                    },
                    child: const Text("Next/पुढे ")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
