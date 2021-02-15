import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_assistant/core/models/location_model.dart';
import 'package:personal_assistant/global/app_color.dart';
import 'package:personal_assistant/global/screen_size.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {

  int hour = TimeOfDay.now().hour;

  @override
  Widget build(BuildContext context) {
    return Consumer<LocationModel>(
      builder: (context, locationModel, _) {

        if(locationModel.weatherIcon == null)
          return Container(
            width: width(context) * 0.47,
            height: 180,
            padding: EdgeInsets.only(left: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: coolGray2
            ),
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20,),
                    Text(
                      hour < 12 ?
                      'Good Morning' :
                      hour < 18 ?
                      'Good Afternoon' :
                      'Good Evening',
                      style: TextStyle(
                          fontSize: 18,
                          color: appWhite
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      'Home',
                      style: TextStyle(
                          fontSize: 16,
                          color: appSilver
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        height: 60, width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: coolGray
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.home,
                                color: appWhite,
                                size: 25,
                              ),
                              Icon(
                                Icons.directions_walk,
                                color: appWhite,
                                size: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 1,),
                      Container(
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
                    ],
                  ),
                )
              ],
            ),
          );

        return Container(
          width: width(context) * 0.47,
          height: 180,
          padding: EdgeInsets.only(left: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: coolGray2
          ),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  Text(
                    hour < 12 ?
                        'Good Morning' :
                        hour < 18 ?
                            'Good Afternoon' :
                            'Good Evening',
                    style: TextStyle(
                      fontSize: 18,
                      color: appWhite
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 16,
                      color: appSilver
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 60, width: 80,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Icon(
                            Icons.home,
                            color: appWhite,
                            size: 60,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Container(
                              height: 40, width: 40,
                              child: CachedNetworkImage(
                                imageUrl: locationModel.weatherIcon,
                                placeholder: (context, asset) => Image(
                                  image: AssetImage(
                                      'assets/placeholders/placeholder.png'
                                  ),
                                  fit: BoxFit.fill,
                                ),
                                imageBuilder: (context, imageProvider) => Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.fill
                                      )
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      height: 60, width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: coolGray
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.home,
                              color: appWhite,
                              size: 25,
                            ),
                            Icon(
                              Icons.directions_walk,
                              color: appWhite,
                              size: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 1,),
                    Container(
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
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
