import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  var nameEditingController = TextEditingController();
  var descEditingController = TextEditingController();
  var placeEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add page"),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(hintText: "Enter item name"),
            controller: nameEditingController,),
            TextField(decoration: InputDecoration(hintText: "Enter item description"),
            controller: descEditingController,),
            TextField(decoration: InputDecoration(hintText: "Enter item place"),
            controller: placeEditingController,),
            ElevatedButton(onPressed: (){

//2) In add.dart, the item need to passed back is sent as the second parameter of navigator.pop
              var itemToPassed = {
                "name":nameEditingController.text,
                "description":descEditingController.text,
                "place":placeEditingController.text,
                "completed":false
              };
              Navigator.pop(context, itemToPassed);


            }, child: Text("Add new item"))
          ],
        ),
      ),
    );
  }
}
