import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'exam.dart';

class ExamCard extends StatelessWidget {
  Exam exam;

  ExamCard(this.exam);
  var formatter = DateFormat('MM/dd/yyyy');

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container (
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(border: Border.all(color: Theme.of(context).primaryColorDark, width: 3)),
          child:
            ListTile(
              leading: const Icon(Icons.cast_for_education),
              title: Text(exam.name, style: const TextStyle(fontSize: 25)),
              subtitle: Container(child: Text(formatter.format(exam.date)),padding: EdgeInsets.fromLTRB(0,10,0,0),)
            )

      ),

    );
  }
  
}