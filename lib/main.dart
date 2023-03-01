import 'package:flutter/material.dart';
import 'examList.dart';
import 'newExam.dart';
import './models/course.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exam App',
      theme: ThemeData(
          primarySwatch: Colors.pink),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final List<Course> _courseList = [
    Course(
        name: 'Mobilni informaciski sistemi',
        date: DateTime.now(),
        id: DateTime.now().toString(),
        time: '12:45'),
    Course(
        name: 'Bazi na podatoci',
        date: DateTime.now(),
        id: DateTime.now().toString(),
        time: '08:00'),
    Course(
        name: 'Verojatnost i statistika',
        date: DateTime.now(),
        id: DateTime.now().toString(),
        time: '17:30'),
  ];

  void _startAddingNewExam(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return GestureDetector(onTap: () {}, child: NewExam(_addNewExam));
      },
    );
  }

  void _addNewExam(String name, DateTime date, String time) {
    setState(() {
      _courseList
          .add(Course(name: name, date: date, id: DateTime.now().toString(), time: time));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Text('Exam App'),
          actions: [
            IconButton(
                onPressed: () => _startAddingNewExam(context),
                icon: Icon(Icons.add))
          ],
        ),
        body: Column(children: [
          Container(child: ExamList(_courseList)),
        ]),
      ),
    );
  }
}
