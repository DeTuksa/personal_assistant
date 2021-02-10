import 'package:flutter/material.dart';
import 'package:personal_assistant/global/app_color.dart';
import 'package:personal_assistant/global/screen_size.dart';

class NewsWidget extends StatefulWidget {
  @override
  _NewsWidgetState createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: width(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: coolGray2
      ),
    );
  }
}
