import 'package:flutter/material.dart';
import 'package:personal_assistant/global/app_color.dart';
import 'package:personal_assistant/global/screen_size.dart';

class ExtraWidget extends StatefulWidget {
  @override
  _ExtraWidgetState createState() => _ExtraWidgetState();
}

class _ExtraWidgetState extends State<ExtraWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context) * 0.47,
      height: 85,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: coolGray2
      ),
    );
  }
}
