import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todos_sept23/widgets/add.dart';
import 'package:todos_sept23/widgets/detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var _todos = [
    {
      "name":"Learn Listview",
      "place":"Online Teams",
      "description":"Learn Listviewm, Listtile, navigation part 2"
    },
    {
      "name":"Have Lunch",
      "place":"Room / Order",
      "description":"KFC Rice Meals"
    },
    {
      "name":"Con call with teams",
      "place":"GMeet",
      "description":"Follow up on Flutter app"
    }
  ];


   // When the page is loaded...
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var todoString = prefs.getString("todos");
    if (todoString != null){
      // We need to transform the String (stored inside our shared preference)
      // into List<dynamic>

      var todoList = jsonDecode(todoString);
      setState(() {
        _todos = todoList;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do App"),
        actions: [
          IconButton(onPressed: () async {
// 1) Create variable to retrieve the item from new Page, and wait for the page to finish
          // If await is used, need to add async to the nearest function {}

          var newItem = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=> AddPage())
          );

          if (newItem != null){
            _todos.add(newItem);

            // SAVE IN SHARED PREFERENCES
// GET THE SHARED PREFERENCE MANAGER (AS IF DOING File in words)
            final SharedPreferences prefs = await SharedPreferences.getInstance();

            // SAVE...
            // Transform List of Map <String,String> into String using jsonEncode
            // Save it as a String
            //  first parameter is the file name,
            // second parameter data that's going to be saved
            prefs.setString("todos", jsonEncode(_todos));
            setState(() {
              _todos;
            });
          }



        }, icon: Icon(Icons.add))],
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),

          // How many rows are there <- 90 percent it will be the lenghth of your datasoirce
          itemCount: _todos.length,
          // What to show on each row <- index on the second argument refer to the row of the list
          // Normally we will retrieve datasource[index]
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                title: Text(_todos[index]["name"]!),
                subtitle: Text(_todos[index]["place"]!),
                trailing: Icon(Icons.chevron_right),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>DetailPage(
                      // 3) Pass the data in the constructor of DetailPage
                      todo: _todos[index],
                    ))
                  );
                },
              ),
            );
          }
      ),
    );
  }
}
