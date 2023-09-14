import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {

  // 1) Create a property/variable to store passed item
  final Map<String,String> todo;

  // 2) Create the constructor of the class to receive the item

  DetailPage({required this.todo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail"),),
      body: Center(child: Column(
        children: [
          Text(todo["name"]!),
          Text(todo["description"]!),
          Text(todo["place"]!),
        ],
      )),
    );
  }
}
