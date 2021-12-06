import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:organizer/main.dart';

import 'exam.dart';

class ExamForm extends StatefulWidget {
  const ExamForm({Key? key}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ExamFormState();
  }

}

class ExamFormState extends State<ExamForm> {
  final _formKey = GlobalKey<FormState>();
  Exam exam = Exam('Test','Test','Test');

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(15,10,15,10),
            child: TextFormField(
            decoration: const InputDecoration(hintText: "Enter exam name"),
            onSaved: (String? value) {
              exam.name = value!;
            },
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter exam name';
              }
              return null;
            },
          ),),
          Padding(
            padding: EdgeInsets.fromLTRB(15,10,15,10),
            child: TextFormField(
              decoration: InputDecoration(hintText: "Enter exam date"),
              // The validator receives the text that the user has entered.
              onSaved: (String? value) {
                exam.date = value!;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter exam date';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15,10,15,10),
            child: TextFormField(
              // The validator receives the text that the user has entered.
              decoration: InputDecoration(hintText: "Enter exam time"),
              onSaved: (String? value) {
                exam.time = value!;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter exam time';
                }
                return null;
              },

            ),

          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  _formKey.currentState!.save();
                  MyHomePage.elements.add(exam);
                  print(MyHomePage.elements.toString());

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Save'),
            ),
          ),
        ],
      ),
    );
  }
}