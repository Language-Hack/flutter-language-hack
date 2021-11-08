import 'package:flutter/material.dart';
import 'package:language_hack/model/quiz.dart';

Map<String, bool>? option;

List<Quiz> questions = [
  Quiz("Banana", {
    "กล้วย": true,
    "ส้ม": false,
    "แอปเปิ้ล": false,
    "เชอรี่": false,
  }),
  Quiz("Orange", {
    "แอปเปิ้ล": false,
    "กล้วย": false,
    "ส้ม": true,
    "เชอรี่": false,
  }),
  Quiz("Cherry", {
    "มะพร้าว": false,
    "กล้วย": false,
    "ส้ม": false,
    "เชอรี่": true,
  }),
  Quiz("Coconut", random("มะพร้าว"))
];

Map<String, bool> random(String value) {
  Map<String, bool> allAnswer = {
    "แอปเปิ้ล": false,
    "เชอรี่": false,
    "มะพร้าว": true,
    "กล้วย": false,
  };
  return {
    "แอปเปิ้ล": false,
    "เชอรี่": false,
    "มะพร้าว": true,
    "กล้วย": false,
  };
}
