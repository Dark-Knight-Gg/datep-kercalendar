import 'package:calendar/utils/dialog.dart';
import 'package:flutter/material.dart';

import 'model/calendar_date_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime startDay = DateTime.now();
  DateTime endDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final config = DateRangePickerButtonConfig(
      calendarType: CalendarDatePickerType.range,
      disableModePicker: true,
    );
    return InkWell(onTap: ()async {
          final values = await showRangeDatePickerDialog(
            context: context,
            config: config,
            dialogSize: const Size(325, 400),
            borderRadius: BorderRadius.circular(15),
            initialValue: [startDay,endDay],
            dialogBackgroundColor: Colors.white,
          );
          if (values != null) {
            setState(() {
              startDay = values[0] ?? DateTime.now();
              endDay = values[1] ?? DateTime.now();
            });
          }
        },
      child: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text('$startDay > $endDay'),
      ),
    );
  }
}
