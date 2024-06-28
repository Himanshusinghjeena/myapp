// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateFormatPicker extends StatefulWidget {
  const DateFormatPicker({super.key});

  @override
  State<DateFormatPicker> createState() => _DateFormatPickerState();
}

class _DateFormatPickerState extends State<DateFormatPicker> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date Format Picker'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                DateTime? datePicked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2050),
                  helpText: "Select Your Date-Of-Birth",
                );
                if (datePicked != null) {
                  setState(() {
                    selectedDate = datePicked;
                  });
                }
              },
              child: const Text("Show Date"),
            ),
            selectedDate != null
                ? Text(
                    "${DateFormat('yyyy-MM-dd').format(selectedDate!)} ${calcAge()}: ${category(calcAge())} ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                : Text(
                    "No date selected",
                    style: TextStyle(fontSize: 20),
                  ),
          ],
        ),
      ),
    );
  }

  int calcAge() {
    DateTime now = DateTime.now();
    DateTime dateOfBirth = selectedDate!;
    int age = now.year - dateOfBirth.year;
    return age;
  }

  String category(int age) {
      if (age >= 18 && age <= 25) {
        return "Young ";
      } else if (age >= 26 && age <= 40) {
        return "Adult";
      } else if (age >= 41 && age <= 60) {
        return "Middle Age";
      } else if (age >= 61 && age <= 80) {
        return "Senior Citizen";
      } else if (age >= 81) {
        return "Old Age";
      } else {
        return "Child";
      }
    } 
  }
