import 'package:flutter/material.dart';
import 'package:personal_assistant/core/repository/repository.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:personal_assistant/core/helper/string_extension.dart';

class SpeechRecModel extends ChangeNotifier {

  String mainText = "";
  String firstText = "";
  String lastStatus = "";
  String lastError = "";
  String currentLocaleId = "";
  int resultListened = 0;

  bool isListening = false;
  bool isReady = false;

  double level = 0.0;
  double confidence = 1.0;
  stt.SpeechToText speechToText = stt.SpeechToText();

  Duration listeningDuration = Duration(seconds: 30);

  SpeechRecModel() {
    recognizeSpeech();
    notifyListeners();
  }

  recognizeSpeech() async {
    isReady = await speechToText.initialize(onError: errorListener, onStatus: statusListener);
    notifyListeners();
    if (isReady) {
      var systemLocale = await speechToText.systemLocale();
      currentLocaleId = systemLocale.localeId;
      print(currentLocaleId);
      print("It works");
      notifyListeners();
    }
  }

  void statusListener(String status) {
    lastStatus = "$status";
    notifyListeners();
    print(lastStatus);
  }

  void errorListener(SpeechRecognitionError error) {
      lastError = '${error.errorMsg} - ${error.permanent}';
      notifyListeners();
      print(lastError);
  }

  void customSpeechRec() async {
    await listenToSpeech().then((value) {
      isListening = false;
      notifyListeners();
    });
    await performOperation();
  }

   Future<void> listenToSpeech() async {
    mainText = "";
    notifyListeners();

    if(isReady) {
      isListening = true;
      notifyListeners();
      await speechToText.listen(
        listenFor: listeningDuration,
        pauseFor: Duration(seconds: 5),
        onResult: (value) {
          mainText = value.recognizedWords.capitalize();
          firstText = firstWord(value.recognizedWords);
          notifyListeners();
          print(firstText);
          print(mainText);
        },
        cancelOnError: true,
        localeId: currentLocaleId,
      );
      notifyListeners();
    } else {
      isListening = false;
      print('no permission or something like that');
      speechToText.stop();
      notifyListeners();
    }
  }

  void performOperation() async {
    if (firstText.toLowerCase() == "call") {
      await Repository().voiceCall('Babycakes');
    }
    notifyListeners();
  }

  String firstWord(String text) {
    int startIndex = 0, indexOfSpace;
    for(int i = 0; i < 1; i++) {
      indexOfSpace = text.indexOf(' ', startIndex);
      if(indexOfSpace == -1) {
        return text;
      }
      startIndex = indexOfSpace + 1;
    }
    return text.substring(0, indexOfSpace);
  }
}