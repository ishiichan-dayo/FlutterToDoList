import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  // debugPaintSizeEnabled = true;
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

class ToDoListPage extends StatefulWidget {
  @override
  _ToDoListPageState createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  bool _isCheckboxCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(2, 10),
              blurRadius: 10,
              color: Color(0xff68B941).withOpacity(0.35),
            ),
          ],
          borderRadius: BorderRadius.circular(1000),
        ),
        child: FloatingActionButton(
          splashColor: Colors.transparent,
          highlightElevation: 0,
          elevation: 0,
          backgroundColor: Color(0xff68B941),
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return TodoListAddPage();
              }),
            );
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                bottom: 20,
              ),
              child: Text(
                'ToDo 📝',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                bottom: 10,
              ),
              child: Text(
                'ALL TASK',
                style: TextStyle(
                  color: Color(0xFF999999),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 30,
                    color: Color(0xFF000000).withOpacity(0.05),
                  ),
                ],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: <Widget>[
                  IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    padding: EdgeInsets.all(0),
                    iconSize: 28,
                    icon: Icon(
                      _isCheckboxCheck ? Icons.check_circle_outline : Icons.radio_button_unchecked,
                      color: _isCheckboxCheck ? Color(0xff68B941) : Color(0xffcccccc),
                    ),
                    onPressed: () {
                      setState(() {
                        _isCheckboxCheck = !_isCheckboxCheck;
                      });
                    },
                  ),
                  Text("取引先にメールしないといけない！"),
                ],
              ),
            ),
          ],
        ),
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
        // backgroundColor: Colors.transparent,
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
