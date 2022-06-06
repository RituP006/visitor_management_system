import 'package:flutter/material.dart';
import 'package:vms_app/utils.dart/constant_widgets.dart';
import 'package:vms_app/utils.dart/route_constants.dart';

import 'package:vms_app/utils.dart/text_styles.dart';

class Details extends StatefulWidget {
  Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final _formKey = GlobalKey<FormState>();
  String selectedValue = "1";
  List<DropdownMenuItem<String>> items =
      ["1", "2", "3", "4", "5"].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Details Page"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            width: double.infinity,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Enter Visit Details/भेट तपशील प्रविष्ट करा",
                    style: Styles.boldHeading,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Text(
                              "Name",
                              style: Styles.regularHeading,
                            ),
                            requiredMark
                          ],
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == "") {
                              return "This field is required";
                            } else if (value!.length < 3) {
                              return "Name should atleast contain 3 characters. ";
                            }
                          },
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              hintText: 'Enter your name',
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 16.0)),
                          style: Styles.regularText1,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "Department of Visit",
                            style: Styles.regularHeading,
                          ),
                          requiredMark
                        ],
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == "") {
                            return "This field is required";
                          }
                        },
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            hintText: "Enter Department Name",
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 16.0)),
                        style: Styles.regularText1,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Members Visiting",
                        style: Styles.regularHeading,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                          border: Border.all(
                            width: 1,
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            disabledHint: const Text("Select number of people"),
                            dropdownColor: Colors.white,
                            isExpanded: true,
                            itemHeight: 50.0,
                            hint:
                                const Text("Select number of people visiting"),
                            style: TextStyle(
                                fontSize: 15.0, color: Colors.grey[700]),
                            items: items,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value.toString();
                              });
                            },
                            value: selectedValue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            Navigator.of(context).pushReplacementNamed(otpPage);
                          }
                        },
                        child: const Text("Continue/पुढे ")),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
