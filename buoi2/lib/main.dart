import 'package:flutter/material.dart';
import 'widgets/custom_button.dart';
import 'widgets/todo_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoScreen(),
    );
  }
}

class TodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Row(
          children: [
            Image(image: AssetImage(
              "assets/images/view-list.png"), // Sử dụng hình ảnh thay thế icon
              width: 40,
              height: 40,
              color: Colors.white,
            ),
            SizedBox(width: 10),
            Text("To-Do List", style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: TodoWidget(),
      ),
    );
  }
}
