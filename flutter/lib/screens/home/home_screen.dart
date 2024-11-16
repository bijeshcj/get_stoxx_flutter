import 'package:flutter/material.dart';

import 'home_tile.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Set the number of columns in the grid
          crossAxisSpacing: 8.0, // Set the spacing between columns
          mainAxisSpacing: 8.0, // Set the spacing between rows
        ),
        itemCount: 18, // Set the number of items in the grid
        itemBuilder: (context, index) {
          return HomeTile();
        },
      ),
    );
  }
}