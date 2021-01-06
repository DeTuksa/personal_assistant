import 'package:flutter/material.dart';
import 'package:personal_assistant/global/app_color.dart';
import 'package:personal_assistant/global/screen_size.dart';

class ArticleWidget extends StatefulWidget {
  @override
  _ArticleWidgetState createState() => _ArticleWidgetState();
}

class _ArticleWidgetState extends State<ArticleWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context) * 0.47,
      height: 180,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: coolGray
      ),
    );
  }
}
