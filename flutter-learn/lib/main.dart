import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';


void main() {
  //ptb1
  double a = 2;
  double b = -4;

  if (a == 0) {
    if (b == 0) {
      print("Phương trình có vô số nghiệm.");
    } else {
      print("Phương trình vô nghiệm.");
    }
  } else {
    double x = -b / a;
    print("Phương trình có nghiệm duy nhất: x = $x");
  }

1  //ptb2
  double e = 1;
  double d = -3;
  double c = 2;
  double delta = d * d - 4 * e * c;

  if (delta < 0) {
    print("Phương trình vô nghiệm.");
  } else if (delta == 0) {
    double x = -d / (2 * e);
    print("Phương trình có nghiệm kép: x = $x");
  } else {
    double x1 = (-d + sqrt(delta)) / (2 * e);
    double x2 = (-d - sqrt(delta)) / (2 * e);
    print("Phương trình có hai nghiệm phân biệt:");
    print("x1 = $x1");
    print("x2 = $x2");
  }

  // can chi
  List<String> thienCan = ["Giáp", "Ất", "Bính", "Đinh", "Mậu", "Kỷ", "Canh", "Tân", "Nhâm", "Quý"];
  List<String> diaChi = ["Tý", "Sửu", "Dần", "Mão", "Thìn", "Tỵ", "Ngọ", "Mùi", "Thân", "Dậu", "Tuất", "Hợi"];

  stdout.write("Nhập năm dương lịch: ");
  int? nam = int.tryParse(stdin.readLineSync() ?? "2004");

  if (nam != null) {
    String can = thienCan[(nam - 4) % 10];
    String chi = diaChi[(nam - 4) % 12];
    print("Năm $nam là năm $can $chi");
  } else {
    print("Vui lòng nhập một số nguyên!");
  }

  //nam nhuan và khong nhuan
  stdout.write("Nhập năm cần kiểm tra: ");
  int? year = int.tryParse(stdin.readLineSync() ?? "2023");
  if (year != null) {
    if ((year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)) {
      print("$year là năm nhuận");
    } else {
      print("$year không phải là năm nhuận");
    }
  } else {
    print("Vui lòng nhập một số nguyên hợp lệ!");
  }

  //Bài toán số siêu lớn
  String operand1 = "4654984515674844948574984534984562163489"; // Số lớn
  String operand2 = "7897498748965418574896415689745648"; // Số lớn

  // Chuyển đổi sang BigInt
  BigInt num1 = BigInt.tryParse(operand1) ?? BigInt.zero;
  BigInt num2 = BigInt.tryParse(operand2) ?? BigInt.zero;

  // Thực hiện tất cả phép toán
  BigInt sum = num1 + num2; // Cộng
  BigInt difference = num1 - num2; // Trừ
  BigInt product = num1 * num2; // Nhân
  BigInt quotient = (num2 != BigInt.zero) ? num1 ~/ num2 : BigInt.zero; // Chia lấy phần nguyên

  // In kết quả
  print("Phép cộng: $sum");
  print("Phép trừ: $difference");
  print("Phép nhân: $product");
  print("Phép chia (lấy phần nguyên): $quotient");





  runApp(const MyApp());

  // TRY THIS: Try changing the seedColor in the colorScheme below to Colors.green
  // and then invoke "hot reload" (save your changes or press the "hot reload" button
  // in a Flutter-supported IDE, or press "r" if you used the command line to start the app).
  // Notice that the counter didn't reset back to zero; the application state is not lost
  // during the reload. To reset the state, use hot restart instead.
  // This works for code too, not just values: Most code changes can be tested with just a hot reload.
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
