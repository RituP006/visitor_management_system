import 'package:flutter/material.dart';

import 'package:vms_app/utils.dart/text_styles.dart';

class Details extends StatefulWidget {
  Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String selectedValue = "0";
    List<DropdownMenuItem<String>> items = ["0", "1", "2", "3", "4", "5"]
        .map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details Page"),
      ),
      body: Center(
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
                TextFormField(
                  validator: (value) {
                    if (value == "") {
                      return "This field is required";
                    } else if (value!.length < 4) {
                      return "Name should atleast contain 3 characters. ";
                    }
                  },
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      label: const Text("Name"),
                      hintText: 'Enter your name',
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0)),
                  style: Styles.buttonTextBlack,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null) {
                      return "This field is required";
                    }
                  },
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      label: const Text("Department Of Visit"),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0)),
                  style: Styles.buttonTextBlack,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                      color: Colors.grey.withAlpha(100)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      dropdownColor: Colors.white,
                      isExpanded: true,
                      itemHeight: 50.0,
                      hint: const Text("Select Category"),
                      style: TextStyle(fontSize: 15.0, color: Colors.grey[700]),
                      items: items,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value.toString();
                          print(selectedValue);
                        });
                      },
                      value: selectedValue,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
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
