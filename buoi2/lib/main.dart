import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScheduleScreen(),
    );
  }
}

class ScheduleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDFDFD),
      body: SafeArea(
        child: Column(
          children: [
            ScheduleHeader(),
            DateSelector(),
            Expanded(
              child: ListView(
                children: [
                  ScheduleList(),
                  SizedBox(height: 20),
                  AnalyticsCard(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

// Widget hiển thị tiêu đề
class ScheduleHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Schedule",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF222222)),
          ),
          Icon(Icons.add, size: 28, color: Color(0xFF222222)),
        ],
      ),
    );
  }
}

// Widget hiển thị ngày tháng
class DateSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(6, (index) {
          return Column(
            children: [
              Text("Feb", style: TextStyle(color: Color(0xFF222222))),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: index == 2 ? Color(0xFF000000) : Color(0xFFF5F5F5),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  "${index + 1}",
                  style: TextStyle(
                    color: index == 2 ? Colors.white : Color(0xFF222222),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(["Mon", "Tue", "Wed", "Thu", "Fri", "Sat"][index], style: TextStyle(color: Color(0xFF222222))),
            ],
          );
        }),
      ),
    );
  }
}

// Widget hiển thị danh sách lịch trình
class ScheduleList extends StatelessWidget {
  final List<Map<String, dynamic>> schedules = [
    {"time": "08:00", "title": "App Application Design", "duration": "08AM - 10AM", "color": Color(0xFF4DB6AC)},
    {"time": "10:00", "title": "Wireframe Design", "duration": "10AM - 11AM", "color": Color(0xFFFFA726)},
    {"time": "11:00", "title": "Dashboard Design", "duration": "11AM - 02PM", "color": Color(0xFF8E24AA)},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: schedules.map((schedule) => ScheduleItem(schedule: schedule)).toList(),
    );
  }
}

// Widget hiển thị từng mục lịch trình
class ScheduleItem extends StatelessWidget {
  final Map<String, dynamic> schedule;

  ScheduleItem({required this.schedule});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
      child: Row(
        children: [
          Text(schedule["time"], style: TextStyle(fontSize: 16, color: Color(0xFF222222))),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: schedule["color"],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(schedule["title"], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  Text(schedule["duration"], style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget hiển thị biểu đồ analytics
class AnalyticsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 5)],
        ),
        child: Column(
          children: [
            Text("70%", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Indicator(color: Color(0xFF4DB6AC), text: "Projects"),
                Indicator(color: Color(0xFFFFA726), text: "Task"),
                Indicator(color: Color(0xFF8E24AA), text: "Meeting"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Widget hiển thị chỉ mục
class Indicator extends StatelessWidget {
  final Color color;
  final String text;

  Indicator({required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 12, height: 12, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        SizedBox(width: 5),
        Text(text, style: TextStyle(fontSize: 14)),
      ],
    );
  }
}

// Widget hiển thị thanh điều hướng
class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color(0xFFFFFFFF),
      currentIndex: 1,
      selectedItemColor: Color(0xFF222222),
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
      ],
    );
  }
}
