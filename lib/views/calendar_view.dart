import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CalendarScreen(),
    );
  }
}

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  final Map<DateTime, List<String>> _events = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay; // update `_focusedDay` here as well
              });
            },
            eventLoader: (day) {
              return _events[day] ?? [];
            },
          ),
          ..._getEventsForDay(_selectedDay).map((event) => ListTile(
            title: Text(event),
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddEventDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }

  List<String> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  void _showAddEventDialog() {
    TextEditingController eventController1 = TextEditingController();
    TextEditingController eventController2 = TextEditingController();
    TextEditingController eventController3 = TextEditingController();
    TextEditingController eventController4 = TextEditingController();
    TextEditingController eventController5 = TextEditingController();
    TextEditingController eventController6 = TextEditingController();
    TextEditingController eventController7 = TextEditingController();
    TextEditingController eventController8 = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Event'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: eventController1,
                  decoration: const InputDecoration(hintText: 'Calories'),
                ),
                TextField(
                  controller: eventController2,
                  decoration: const InputDecoration(hintText: 'Total Fat'),
                ),
                TextField(
                  controller: eventController3,
                  decoration: const InputDecoration(hintText: 'Cholesterol'),
                ),
                TextField(
                  controller: eventController4,
                  decoration: const InputDecoration(hintText: 'Sodium'),
                ),
                TextField(
                  controller: eventController5,
                  decoration: const InputDecoration(hintText: 'Total Carbohydrate'),
                ),
                TextField(
                  controller: eventController6,
                  decoration: const InputDecoration(hintText: 'Fiber'),
                ),
                TextField(
                  controller: eventController7,
                  decoration: const InputDecoration(hintText: 'Total Sugar'),
                ),
                TextField(
                  controller: eventController8,
                  decoration: const InputDecoration(hintText: 'Protein'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (eventController1.text.isNotEmpty || eventController2.text.isNotEmpty|| eventController3.text.isNotEmpty || eventController4.text.isNotEmpty || eventController5.text.isNotEmpty || eventController6.text.isNotEmpty || eventController7.text.isNotEmpty || eventController8.text.isNotEmpty) {
                  _addEvent('Calories: ${eventController1.text}\nTotal Fat: ${eventController2.text}\nCholesterol: ${eventController3.text}\nSodium: ${eventController4.text}\nTotal Carbohydrates: ${eventController5.text}\nFiber: ${eventController6.text}\nTotal Sugar: ${eventController7.text}\nProtein: ${eventController8.text}');
                }
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _addEvent(String event) {
    setState(() {
      if (_events[_selectedDay] != null) {
        _events[_selectedDay]!.add(event);
      } else {
        _events[_selectedDay] = [event];
      }
    });
  }
}