// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class TextFieldScreen extends StatefulWidget {
  const TextFieldScreen({super.key});

  @override
  State<TextFieldScreen> createState() => _TextFieldScreenState();
}

class _TextFieldScreenState extends State<TextFieldScreen> {
  String name = "";
  String email = "";
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField Practice"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Enter Your Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Name is required";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    name = newValue!;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Enter Your Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email is required";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    email = newValue!;
                  },
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  child: Text("Submit"),
                  onPressed: () {
                    bool isAllFieldsValid = formKey.currentState!.validate();
                    if (isAllFieldsValid) {
                      formKey.currentState!.save();

                      print("Name: $name");
                      print("Email: $email");
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



// Once press submit button 
// 1- validation (make sure all fields are not empty, if empty show error)
// 2- save entered data and print it to console


//Steps:
// use statefull widget
// declare varaible name and email (one for each textfield)
// use textformfield insteade of textfield
// wrap all textformfield in form widget
// declare from key and use it to access form data in submit button
// add validators and onSaved to all textformfields
// on press validate and save