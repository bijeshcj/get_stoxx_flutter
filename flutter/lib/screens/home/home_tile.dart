import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeTile extends StatefulWidget{


  HomeTile({super.key});

  @override
  State<HomeTile> createState() => _HomeTileState();
}

class _HomeTileState extends State<HomeTile> {

  List<MaterialColor> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.teal,
    Colors.indigo,
    Colors.cyan,
    Colors.brown,
    Colors.grey
  ];

  // Future<List<ToDo>>? futureTodos;
  // final todoDb = TodoDB();


  @override
  void initState(){
    fetchTodos();
  }

  void fetchTodos(){
    // setState(() {
    //   futureTodos = todoDb.fetchAll();
    // });
  }

  MaterialColor getRandomColor(){
    return colors[Random().nextInt(11)];
  }

  bool _isBellRinging = false;

  void onTap(){
    // Alarm.stop(42);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0, // Set the width of the box
      height: 100.0, // Set the height of the box
      padding: EdgeInsets.all(16.0), // Optional: Add padding inside the box
      decoration: BoxDecoration(
        color: getRandomColor(), // Set the background color of the box

        borderRadius: BorderRadius.circular(8.0), // Optional: Add rounded corners
      ),
      child: GestureDetector(
        onTap: onTap,
        child:  const Center(
          child: Column(
            children: [
              Text(
                'Show All Stocks',
                style: TextStyle(
                    color: Colors.black, // Set the text color
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold// Set the text font size
                ),
              ),
              SizedBox(height: 10,),
              Expanded(
                child: Text(
                  'Show all the stocks listed in Indian Market',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: TextStyle(
                    color: Colors.black, // Set the text color
                    fontSize: 16.0, // Set the text font size
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}