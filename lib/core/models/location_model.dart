import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationModel extends ChangeNotifier {
  StreamSubscription stream;
  Position currentPosition;
  String currentAddress;
  List<Placemark> p;
  GeolocatorPlatform geolocator;

  LocationModel() {
    stream = getCurrentLocation();
    notifyListeners();
  }

  getCurrentLocation() {
    GeolocatorPlatform.instance.getPositionStream(
        desiredAccuracy: LocationAccuracy.best,
        forceAndroidLocationManager: true,
      timeInterval: 1,
      timeLimit: Duration(minutes: 1)
    ).listen((Position position) async {
      currentPosition = position;
      notifyListeners();
      try {
        p = await placemarkFromCoordinates(
            currentPosition.latitude, currentPosition.longitude
        );
        Placemark place = p[0];
        currentAddress = "${place.locality}, ${place.country}";
        notifyListeners();
      } catch(e) {
        print(e);
      }
    });
  }

  cancelStream() {
    stream.cancel();
  }
}