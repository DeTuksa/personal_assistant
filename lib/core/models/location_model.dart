import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weather/weather.dart';

class LocationModel extends ChangeNotifier {
  StreamSubscription stream;
  Position currentPosition;
  String currentAddress = '';
  List<Placemark> p;
  GeolocatorPlatform geolocator;
  bool serviceEnabled;
  LocationPermission permission;

  WeatherFactory weatherFactory = new WeatherFactory(
      "1523a0a7dfccee30b3b2c1ba576dc33e",
      language: Language.ENGLISH
  );

  double weatherCondition;
  double temperature;
  Weather weather;

  LocationModel() {
    permissionRequest();
    stream = getCurrentLocation();
    notifyListeners();
  }

  permissionRequest() async {
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    notifyListeners();
    if(!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied'
      );
    }
    if(permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      notifyListeners();
      if(permission != LocationPermission.whileInUse
      && permission != LocationPermission.always) {
        return Future.error(
          'Location permissions are denied (actual value: $permission).'
        );
      }
    }
    return await Geolocator.getCurrentPosition();
  }

  getCurrentLocation() {
    GeolocatorPlatform.instance.getPositionStream(
        desiredAccuracy: LocationAccuracy.best,
        forceAndroidLocationManager: true,
      timeInterval: 1,
      timeLimit: Duration(seconds: 90)
    ).listen((Position position) async {
      currentPosition = position;
      notifyListeners();
      try {
        p = await placemarkFromCoordinates(
            currentPosition.latitude, currentPosition.longitude
        );
        Placemark place = p[0];
        currentAddress = "${place.locality}, ${place.country}";
        print(currentAddress);
        notifyListeners();
      } catch(e) {
        print(e);
      }
      getWeather();
      notifyListeners();
    });
  }

  getWeather() async {
    weather = await weatherFactory.currentWeatherByLocation(
      currentPosition.latitude, currentPosition.longitude
    );
    print(weather.temperature);
    print(weather.weatherDescription);
  }

  cancelStream() {
    stream.cancel();
  }
}