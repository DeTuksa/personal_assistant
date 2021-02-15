import 'package:flutter/material.dart';
import 'package:personal_assistant/global/app_color.dart';

class VoiceActivationWidget extends StatefulWidget {

  final VoidCallback onTapFunction;

  VoiceActivationWidget({this.onTapFunction});

  @override
  _VoiceActivationWidgetState createState() => _VoiceActivationWidgetState();
}

class _VoiceActivationWidgetState extends State<VoiceActivationWidget> with SingleTickerProviderStateMixin {

  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animationController.repeat(reverse: true);
    _animation = Tween(begin: 4.0, end: 12.0).animate(_animationController)..addListener(() {
      setState(() {
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(40),
      onTap: this.widget.onTapFunction,
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(40),
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: appBlue,
                blurRadius: _animation.value,
                spreadRadius: _animation.value,
                offset: Offset(
                  0.0, 0.0
                )
              ),
              BoxShadow(
                  color: appCyan,
                  blurRadius: _animation.value * 0.25,
                  spreadRadius: _animation.value * 0.25,
                  offset: Offset(
                      0.0, 0.0
                  )
              )
            ],
            color: appBlack
          ),
          child: Stack(
            children: [
              Center(
                child: SizedBox(
                  height: 50, width: 50,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(appBlue),
                    backgroundColor: appCyan,
                    strokeWidth: 1.5,
                  ),
                ),
              ),
              Center(
                child: Icon(
                  Icons.mic,
                  color: appWhite,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
