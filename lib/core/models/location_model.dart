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

  WeatherFactory weatherFactory = new WeatherFactory(
      "1523a0a7dfccee30b3b2c1ba576dc33e",
      language: Language.ENGLISH
  );

  double weatherCondition;
  double temperature;
  Weather weather;

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