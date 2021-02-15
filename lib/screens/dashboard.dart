import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:personal_assistant/core/routing/my_route.gr.dart';
import 'package:personal_assistant/global/app_color.dart';
import 'package:personal_assistant/global/screen_size.dart';
import 'package:personal_assistant/widgets/article_widget.dart';
import 'package:personal_assistant/widgets/extra_widget.dart';
import 'package:personal_assistant/widgets/home_widget.dart';
import 'package:personal_assistant/widgets/motivation_widget.dart';
import 'package:personal_assistant/widgets/news_widget.dart';
import 'package:personal_assistant/widgets/note_widget.dart';
import 'package:personal_assistant/widgets/reminder_widget.dart';
import 'package:personal_assistant/widgets/voice_activation_widget.dart';
import 'package:personal_assistant/widgets/weather_widget.dart';

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
          Container(
            height: height(context),
            width: width(context),
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 120, left: 8, right: 8
                  ),
                  child: Container(
                    width: width(context),
                    height: 280,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            WeatherWidget(),
                            ReminderWidget()
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ArticleWidget(),
                            MotivationWidget()
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 8, right: 8, top: 10
                  ),
                  child: NewsWidget(),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 15, left: 8, right: 8
                  ),
                  child: Container(
                    width: width(context),
                    height: 180,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HomeWidget(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ExtraWidget(),
                            NoteWidget()
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 100, width: width(context),
              color: coolGray2,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.menu_sharp,
                    color: appWhite,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'my',
                      style: TextStyle(
                        color: appWhite
                      ),
                      children: [
                        TextSpan(
                          text: 'Assistant',
                          style: TextStyle(
                            color: appWhite,
                            fontWeight: FontWeight.bold
                          )
                        )
                      ]
                    ),
                  ),
                  Icon(
                    Icons.view_carousel_rounded,
                    color: appSilver,
                  ),
                ],
              ),
              padding: EdgeInsets.only(left: 8, right: 8, top: 20),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: VoiceActivationWidget(
                onTapFunction: () {
                  ExtendedNavigator.of(context).push("${Routes.listeningScreen}");
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
