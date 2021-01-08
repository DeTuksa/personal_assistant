import 'package:flutter/material.dart';
import 'package:personal_assistant/core/models/location_model.dart';
import 'package:personal_assistant/global/app_color.dart';
import 'package:personal_assistant/global/screen_size.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class WeatherWidget extends StatefulWidget {
  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LocationModel>(
      builder: (context, locationModel, child) {

        if (locationModel.currentPosition == null
         && locationModel.currentAddress == null
        && locationModel.currentAddress == ""
        && locationModel.weather.weatherDescription == null
        && locationModel.weather.temperature == null) {
          return Container(
            width: width(context) * 0.47,
            height: 180,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: coolGray2
            ),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      Text(
                        '${DateFormat().add_jm().format(DateTime.now())}',
                        style: TextStyle(
                            color: appWhite,
                            fontSize: 20
                        ),
                      ),
                      SizedBox(height: 5,),
                     SizedBox(
                       height: 70, width: 70,
                       child: CircularProgressIndicator(
                         valueColor: AlwaysStoppedAnimation<Color>(appCyan),
                       ),
                     ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 60, width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: coolGray
                    ),
                    child: Center(
                      child: Icon(
                        Icons.bolt,
                        color: appWhite,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }

        return Container(
          width: width(context) * 0.47,
          height: 180,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: coolGray2
          ),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Text(
                      '${DateFormat().add_jm().format(DateTime.now())}',
                      style: TextStyle(
                        color: appWhite,
                        fontSize: 20
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      locationModel.currentAddress,
                      style: TextStyle(
                        color: appWhite,
                        fontSize: 16
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${locationModel.weather
                              .temperature.celsius.toStringAsFixed(1)}",
                          style: TextStyle(
                            color: appCyan,
                            fontSize: 30
                          ),
                        ),
                        SizedBox(width: 5,),
                        Text(
                          '°C',
                          style: TextStyle(
                            color: appWhite
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Text(
                      locationModel.weather.weatherDescription,
                      style: TextStyle(
                        color: appWhite,
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 60, width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: coolGray
                  ),
                  child: Center(
                    child: Icon(
                      Icons.bolt,
                      color: appWhite,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
