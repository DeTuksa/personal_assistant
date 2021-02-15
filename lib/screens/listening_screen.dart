import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_assistant/core/models/speech_recognition_model.dart';
import 'package:personal_assistant/global/app_color.dart';
import 'package:personal_assistant/global/screen_size.dart';
import 'package:personal_assistant/widgets/voice_activation_widget.dart';
import 'package:provider/provider.dart';

class ListeningScreen extends StatefulWidget {
  @override
  _ListeningScreenState createState() => _ListeningScreenState();
}

class _ListeningScreenState extends State<ListeningScreen> with SingleTickerProviderStateMixin {

  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 180));
    _animationController.repeat(reverse: true);
    _animation = Tween(begin: 4.0, end: 12.0).animate(_animationController)..addListener(() {
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBlack,
      body: Consumer<SpeechRecModel>(
        builder: (context, speechRecModel, _) {
          return Container(
            height: height(context),
            width: width(context),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 60, left: 12, right: 12
                    ),
                    child: Container(
                      width: width(context),
                      height: 60,
                      decoration: BoxDecoration(
                          color: coolGray2,
                          borderRadius: BorderRadius.circular(8)
                      ),
                      padding: EdgeInsets.only(left: 18, right: 18),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.keyboard,
                            color: appSilver,
                          ),
                          Text(
                            'Hey myAssistant, start my day.',
                            style: TextStyle(
                                color: appWhite
                            ),
                          ),
                          Container(
                            width: 40, height: 40,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: 40, left: 20, right: 20, top: 40
                    ),
                    child: Container(
                      width: width(context),
                      height: height(context),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Material(
                            elevation: 4,
                            borderRadius: BorderRadius.circular(120),
                            child: Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(120),
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
                                      height: 200, width: 200,
                                      child: CircularProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation<Color>(appBlue),
                                        backgroundColor: appCyan,
                                        strokeWidth: 3.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 40,),
                          Text(
                            speechRecModel.mainText == "" && speechRecModel.speechToText.isListening == false ?
                            'Hey user, how may I help you?' :
                            speechRecModel.mainText == "" && speechRecModel.speechToText.isListening == true ?
                            'Listening' :
                            speechRecModel.mainText,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: appWhite,
                                fontSize: 20,
                                fontWeight: FontWeight.w200
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: VoiceActivationWidget(
                      onTapFunction: speechRecModel.speechToText.isListening ? null : () {
                        speechRecModel.listenToSpeech();
                      },
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
