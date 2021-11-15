import 'package:flutter/material.dart';
import 'package:language_hack/model/quiz.dart';
import 'package:language_hack/screens/questions_list/questions_method.dart';

List<Quiz> questions = [
  randomQuestions("วันอาทิตย์", "Sunday", "Sunday (วันอาทิตย์)"),
  randomQuestions("กล้วย", "Banana", "Banana (กล้วย)"),
  randomQuestions("สีแดง", "Red", "Red (สีแดง)"),
  randomQuestions("มะพร้าว", "Coconut", "Coconut (มะพร้าว)"),
  randomQuestions("โครงกระดูก", "Skeleton", "Skeleton (โครงกระดูก)"),
  randomQuestions("ผ้าพันคอ", "Scarf", "Scarf (ผ้าพันคอ)"),
  randomQuestions("ฝน", "Rain", "Rain (ฝน)"),
  randomQuestions("เศร้า", "Sad", "Sad (เศร้า)"),
  randomQuestions("สูญพันธุ์", "Extinct", "Extinct (สูญพันธุ์)"),
  randomQuestions("ล้อ", "Wheel", "Wheel (ล้อ)"),
  randomQuestions("การคดโกง", "Cheat", "Cheat (การคดโกง)"),
  randomQuestions("การเพิ่มขึ้น", "Increase", "Increase (การเพิ่มขึ้น)"),
];
