import 'package:flutter/material.dart';

class Book {
  final int id;
  final String title;
  final String level;
  final String urlImage;
  final Widget screen;
  int score;

  Book({
    this.id,
    this.level,
    this.title,
    this.urlImage,
    this.screen,
    this.score,
  });

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json['id'],
        level: json['level'],
        title: json['title'],
        urlImage: json['urlImage'],
        screen: json['screen'],
        score: json['score'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'level': level,
        'urlImage': urlImage,
        'screen': screen,
        'score': score,
      };
}
