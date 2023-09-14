import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {

  // 1) Create a property/variable to store passed item
  final Map<String,dynamic> todo;
  final int index;

  // 2) Create the constructor of the class to receive the item

  DetailPage({required this.todo, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail"),),
      body: Center(child: Column(
        children: [
          Text(todo["name"]!, style: TextStyle(fontSize: 32, color: Colors.red),),
          SizedBox(height: 8,),
          Text(todo["description"]!, style: TextStyle(fontSize: 24), textAlign: TextAlign.center,),
          SizedBox(height: 8,),
          Text(todo["place"]!),
          SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(onPressed: (){


              },
                  icon: Icon(Icons.check), label: Text("Mark as complete")),
              ElevatedButton.icon(onPressed: (){

                var userAction = {
                  "action":1, // ASsuming 0 is edit completed and 1 is delete
                  "index":index
                };
                Navigator.pop(context, userAction);
              },
                  icon: Icon(Icons.delete), label: Text("Delete")),

            ],
          )

        ],
      )),
    );
  }
}
