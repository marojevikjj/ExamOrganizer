// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class ExamList extends StatefulWidget {
//   @override
//   _ExamListState createState() => _ExamListState();
// }
//
// class _ExamListState extends State<ExamList> {
//   List<String> propList = [];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//         itemCount: propList.length,
//         scrollDirection: Axis.horizontal,
//         shrinkWrap: true,
//         itemBuilder: (context,index)=> Text(propList[index]),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => setState(() => propList.add('text')),
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }