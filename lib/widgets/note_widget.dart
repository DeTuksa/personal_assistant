import 'package:flutter/material.dart';
import 'package:personal_assistant/global/app_color.dart';
import 'package:personal_assistant/global/screen_size.dart';

class NoteWidget extends StatefulWidget {
  @override
  _NoteWidgetState createState() => _NoteWidgetState();
}

class _NoteWidgetState extends State<NoteWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context) * 0.47,
      height: 85,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: coolGray
      ),
    );
  }
}
