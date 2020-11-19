import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

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
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
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

List<bool> todoListCheck = [
  false,
  false,
  false,
];
List<String> todoList = [
  "SAMPLE",
  "SAMPLE",
  "SAMPLESAMPLESAMPLESAMPLESAMPLESAMPLESAMPLESAMPLESAMPLESAMPLESAMPLESAMPLESAMPLESAMPLE",
];

class _ToDoListPageState extends State<ToDoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFFFD),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.notifications_outlined),
        //     onPressed: () {},
        //   ),
        // ],
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
          highlightElevation: 0,
          elevation: 0,
          backgroundColor: Color(0xff68B941),
          child: Icon(Icons.add),
          onPressed: () async {
            final newListText = await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return TodoListAddPage();
              }),
            );
            if (newListText != null) {
              setState(() {
                todoList.add(newListText);
              });
            }
          },
        ),
      ),
      body: Container(
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
                  fontSize: 36,
                  color: Color(0xFF21604D),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                bottom: 15,
              ),
              child: Text(
                'ALL TASK',
                style: TextStyle(
                  color: Color(0xFF93C0B2),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            Flexible(
              child: ListView.separated(
                // shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => Divider(
                  color: Colors.transparent,
                  height: 16,
                ),
                padding: EdgeInsets.only(
                  bottom: 90,
                ),
                itemCount: todoList.length,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 600),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFFFFF),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 30,
                                color: Color(0xFF21604D).withOpacity(0.15),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: <Widget>[
                              IconButton(
                                padding: EdgeInsets.all(20),
                                iconSize: 28,
                                icon: Icon(
                                  todoListCheck.elementAt(index) ? Icons.check_circle : Icons.radio_button_unchecked,
                                  color: todoListCheck.elementAt(index) ? Color(0xff68B941) : Color(0xffcccccc),
                                ),
                                onPressed: () {
                                  setState(() {
                                    todoListCheck[index] = !todoListCheck.elementAt(index);
                                  });
                                },
                              ),
                              Flexible(
                                child: Container(
                                  padding: EdgeInsets.only(
                                    top: 20,
                                    right: 20,
                                    bottom: 20,
                                    left: 0,
                                  ),
                                  child: Text(
                                    todoList[index],
                                    style: TextStyle(
                                      color: todoListCheck.elementAt(index) ? Color(0xFF666666) : Color(0xFF333333),
                                      decoration: todoListCheck.elementAt(index) ? TextDecoration.lineThrough : TextDecoration.none,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TodoListAddPage extends StatefulWidget {
  @override
  _TodoListAddPageState createState() => _TodoListAddPageState();
}

class _TodoListAddPageState extends State<TodoListAddPage> {
  String taskTitle = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFFFD),
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
              todoListCheck.add(false);
              Navigator.of(context).pop(taskTitle);
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
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          child: Stack(
            children: <Widget>[
              TextField(
                autocorrect: true,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  hintText: "タイトル",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF999999),
                  ),
                  prefixStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                ),
                onChanged: (String value) {
                  setState(() {
                    taskTitle = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
