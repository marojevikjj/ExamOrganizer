import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:organizer/calendar.dart';
import 'package:organizer/main.dart';

import 'exam.dart';
import 'exam_calendar_model.dart';

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
  TextEditingController timeinput = TextEditingController();
  Exam exam = Exam('Test',DateTime.now(),TimeOfDay.now());

  @override
  void initState() {
    timeinput.text = ""; //set the initial value of text field
    super.initState();
  }

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
              decoration: const InputDecoration(hintText: "Enter name"),
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
            child: InputDatePickerFormField(firstDate:  DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 9, 0, 0),
              lastDate: DateTime(2200,12,1),
            // decoration: const InputDecoration(hintText: "Enter exam name"),
            onDateSaved: (DateTime? value) {
              exam.date = value!;
            },
            // The validator receives the text that the user has entered.
            // validator: (value) {
            //   if (value == null || value.isEmpty) {
            //     return 'Please enter exam name';
            //   }
            //   return null;
            // },
          ),),
          // Padding(
          //   padding: EdgeInsets.fromLTRB(15,10,15,10),
          //   child: InputDatePickerFormField(
          //
          //     // decoration: InputDecoration(hintText: "Enter exam date"),
          //     // The validator receives the text that the user has entered.
          //     onSaved: (String? value) {
          //       exam.date = value!;
          //     },
          //     validator: (value) {
          //       if (value == null || value.isEmpty) {
          //         return 'Please enter exam date';
          //       }
          //       return null;
          //     },
          //   ),
          // ),
          // Padding(
          //   padding: EdgeInsets.fromLTRB(15,10,15,10),
          //   child: TextFormField(
          //     // The validator receives the text that the user has entered.
          //     decoration: InputDecoration(hintText: "Enter exam time"),
          //     onSaved: (String? value) {
          //       exam.time = value!;
          //     },
          //     validator: (value) {
          //       if (value == null || value.isEmpty) {
          //         return 'Please enter exam time';
          //       }
          //       return null;
          //     },
          //
          //   ),
          //
          // ),
          Padding(
            padding: EdgeInsets.fromLTRB(15,10,15,10),
            child: TextField(
              controller: timeinput, //editing controller of this TextField
              decoration: InputDecoration(
                  labelText: "Enter Time" //label text of field
              ),
              readOnly: true,
              onTap: () async {
                TimeOfDay? pickedTime =  await showTimePicker(
                  initialTime: TimeOfDay.now(),
                  context: context,
                );

                if(pickedTime != null ){
                  print(pickedTime.format(context));   //output 10:51 PM
                  DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                  //converting to DateTime so that we can further format on different pattern.
                  print(parsedTime); //output 1970-01-01 22:53:00.000
                  String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
                  print(formattedTime); //output 14:59:00
                  //DateFormat() is from intl package, you can format the time on any pattern you need.

                  setState(() {
                    timeinput.text = formattedTime; //set the value of text field.
                  });
                  exam.time = pickedTime;
                }else{
                  print("Time is not selected");
                }
              },
              // The validator receives the text that the user has entered.
              // decoration: InputDecoration(hintText: "Enter exam time"),
              // onSaved: (String? value) {
              //   exam.time = value!;
              // },
              // validator: (value) {
              //   if (value == null || value.isEmpty) {
              //     return 'Please enter exam time';
              //   }
              //   return null;
              // },

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

                  final DateTime startTime = DateTime(exam.date.year, exam.date.month, exam.date.day, exam.time.hour, exam.time.minute, 0);
                  final DateTime endTime = startTime.add(const Duration(hours: 2));
                  CalendarState.meetings.add(ExamCalendar(
                      exam.name, startTime, endTime, const Color(0xFF0F8644), false));
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