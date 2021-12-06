import 'package:flutter/material.dart';
import 'package:organizer/exam.dart';
import 'package:organizer/exam_card.dart';
import 'package:organizer/exam_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exam organizer',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blueGrey,
      ),
      home:  MyHomePage(title: 'My exam organizer'),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   final String title;
//   final List<Exam> elements;
//
//   const MyHomePage({Key? key, required this.title, required this.elements}) : super(key: key);
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState(elements: elements);
//
// }
class MyHomePage extends StatelessWidget {
  final String title;
  static List<Exam> elements = [Exam("Mobile Information systems", "07.12.2021", "16.00"),Exam("Data science", "08.12.2021", "08.00")];


  void addExam(Exam exam) {
    elements.add(exam);
  }

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(children: [
        Row(children: const [
          Center(child: Padding(
            padding: EdgeInsets.all(13),
            child: Text(
              'Add a new exam',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),),
         ],
        ),
      Row( children: [Expanded(child: ExamForm())]),
      Expanded(child: ListView.builder(itemCount: elements.length,itemBuilder: (contx,index) {
        return ExamCard(elements[index]);
      })),
      ],));
  }


}

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//   final List<Exam> elements;
//   _MyHomePageState({Key? key, required this.elements});
//
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           children: const [
//             Padding(
//               padding: EdgeInsets.all(13),
//               child: Text(
//                 'Add a new exam',
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//               ),
//             )
//
//
//           ],
//
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//       // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
