import 'package:flutter/material.dart';
import 'presenter.dart';

class CalorieTrackerPage extends StatefulWidget {
  final AppPresenter presenter;

  CalorieTrackerPage(this.presenter);

  @override
  _CalorieTrackerPageState createState() => _CalorieTrackerPageState();
}

class _CalorieTrackerPageState extends State<CalorieTrackerPage> {
  final TextEditingController _calorieController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calorie Tracker'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _calorieController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Calories',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                int calories = int.tryParse(_calorieController.text) ?? 0;
                widget.presenter.addCalorieEntry(calories);
                _calorieController.clear();
              },
              child: Text('Add Calorie Entry'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                widget.presenter.showTotalCalories();
              },
              child: Text('Show Total Calories'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Pop the current page (CalorieTrackerPage) off the stack and go back to the HomePage
                Navigator.pop(context);
              },
              child: Text('Back to Home'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
            ),
          ],
        ),
      ),
    );
  }
}