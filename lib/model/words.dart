import 'dart:convert';

class Words {
  final String word;
  final String meaning;
  final String example;
  Words({
    this.word,
    this.meaning,
    this.example,
  });

  Words copyWith({
    String word,
    String meaning,
    String example,
  }) {
    return Words(
      word: word ?? this.word,
      meaning: meaning ?? this.meaning,
      example: example ?? this.example,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'word': word,
      'meaning': meaning,
      'example': example,
    };
  }

  factory Words.fromMap(Map<String, dynamic> map) {
    return Words(
      word: map['word'],
      meaning: map['meaning'],
      example: map['example'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Words.fromJson(String source) => Words.fromMap(json.decode(source));

  @override
  String toString() =>
      'Words(word: $word, meaning: $meaning, example: $example)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Words &&
        other.word == word &&
        other.meaning == meaning &&
        other.example == example;
  }

  @override
  int get hashCode => word.hashCode ^ meaning.hashCode ^ example.hashCode;
}
