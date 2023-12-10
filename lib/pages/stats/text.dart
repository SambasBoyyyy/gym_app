import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import for date formatting

class DatePickerWidget extends StatefulWidget {
  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime selectedDate = DateTime.now(); // Initialize selectedDate with today's date

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('E, d MMM yyyy').format(selectedDate); // Format the selected date

    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            _selectDate(context); // Call _selectDate method on icon click
          },
          child: Row(
            children: <Widget>[
              Icon(Icons.calendar_month),
              SizedBox(width: 10), // Add some space between the icon and text
              Text(formattedDate), // Show the selected date here
            ],
          ),
        ),
      )
    );
  }
}