// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_tts/flutter_tts.dart';

Future textToSpeech(String text, double rate, String lang) async {
  final FlutterTts flutterTts = FlutterTts();

  await flutterTts.setLanguage(lang);
  await flutterTts.setPitch(1.0);
  await flutterTts.setSpeechRate(rate);

  final List<String> chunks = RegExp('.{1,4000}', dotAll: true)
      .allMatches(text)
      .map((e) => e.group(0)!)
      .toList();

  for (String chunk in chunks) {
    await flutterTts.speak(chunk);
    await Future.delayed(const Duration(seconds: 2));
  }
}
