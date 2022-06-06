import 'dart:async';

import 'package:flutter/material.dart';

import 'package:vms_app/utils.dart/route_constants.dart';
import 'package:vms_app/utils.dart/text_styles.dart';
import 'package:vms_app/widgets/otp_input.dart';

class Verification extends StatefulWidget {
  Verification({Key? key}) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  String? _otp;

  Timer? countdownTimer;
  Duration myDuration = const Duration(minutes: 1);
  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  void resetTimer() {
    stopTimer();
    setState(() => myDuration = const Duration(minutes: 1));
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  bool verifyOtp(otp) {
    return otp == "1234";
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _fieldOne.dispose();
    _fieldTwo.dispose();
    _fieldThree.dispose();
    _fieldFour.dispose();
    countdownTimer!.cancel();
  }

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
                  "Enter 4 digit otp/4 अंकी otp प्रविष्ट करा",
                  textAlign: TextAlign.center,
                  style: Styles.boldHeading,
                ),
                const SizedBox(
                  height: 28,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OtpInput(_fieldOne, true),
                    OtpInput(_fieldTwo, false),
                    OtpInput(_fieldThree, false),
                    OtpInput(_fieldFour, false)
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.timer,
                      size: 20,
                    ),
                    Text(
                      ": " + myDuration.inSeconds.toString(),
                      style: Styles.regularText2,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          _fieldOne.clear();
                          _fieldTwo.clear();
                          _fieldThree.clear();
                          _fieldFour.clear();
                          resetTimer();
                          startTimer();
                        },
                        child: const Text('Resend')),
                    const SizedBox(
                      width: 5,
                    ),
                    ElevatedButton(
                        onPressed: (_fieldOne.text.isNotEmpty &&
                                _fieldTwo.text.isNotEmpty &&
                                _fieldThree.text.isNotEmpty &&
                                _fieldFour.text.isNotEmpty)
                            ? () {
                                _otp = _fieldOne.text +
                                    _fieldTwo.text +
                                    _fieldThree.text +
                                    _fieldFour.text;

                                if (verifyOtp(_otp)) {
                                  Navigator.of(context)
                                      .pushReplacementNamed(successPage);
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: const Text("Invalid OTP"),
                                          backgroundColor:
                                              Colors.red.shade700));
                                }
                              }
                            : null,
                        child: const Text("Submit")),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
