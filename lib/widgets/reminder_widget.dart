import 'package:flutter/material.dart';
import 'package:personal_assistant/global/app_color.dart';
import 'package:personal_assistant/global/screen_size.dart';

class ReminderWidget extends StatefulWidget {
  @override
  _ReminderWidgetState createState() => _ReminderWidgetState();
}

class _ReminderWidgetState extends State<ReminderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context) * 0.47,
      height: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: coolGray
      ),
    );
  }
}
