import 'package:flutter/material.dart';
import 'package:todos_sept23/widgets/add.dart';
import 'package:todos_sept23/widgets/detail.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do App"),
        actions: [IconButton(onPressed: () {

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=> AddPage())
          );

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
