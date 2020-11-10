import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryIconTheme: IconThemeData(
          color: Colors.black,
        ),
        primaryTextTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      home: ToDoListPage(),
    );
  }
}

class ToDoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("ToDoList"),
      //   centerTitle: false,
      //   backgroundColor: Colors.transparent,
      //   elevation: 0.0,
      //   brightness: Brightness.light,
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return TodoListAddPage();
            }),
          );
        },
        child: Container(
          margin: EdgeInsets.all(15.0),
          child: Icon(Icons.add),
        ),
        elevation: 0.0,
      ),
      body: Center(
        child: Text('まだToDoがありません'),
      ),
    );
  }
}

class TodoListAddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            color: Color(0xff68B941),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              },
            );
          },
        ),
      ),
      body: Center(
        child: TodoAddForm(),
      ),
    );
  }
}

class TodoAddForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              hintText: "タイトル",
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
