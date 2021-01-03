import 'package:flutter/material.dart';
import 'package:personal_assistant/global/app_color.dart';
import 'package:personal_assistant/global/screen_size.dart';
import 'package:personal_assistant/widgets/voice_activation_widget.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBlack,
      body: Stack(
        children: [
          Container(height: height(context), width: width(context),),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: VoiceActivationWidget(),
            ),
          )
        ],
      ),
    );
  }
}
