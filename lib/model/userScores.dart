import 'dart:convert';

class UserScores {
  int adjective_score;
  int carPart_score;
  int clothes_score;
  int color_score;
  int countries_score;
  int days_score;
  int dbFood_score;
  int environment_score;
  int family_score;
  int feeling_score;
  int football_score;
  int fruit_score;
  int halloween_score;
  int ielts_score;
  int months_score;
  int music_score;
  int office_score;
  int place_score;
  int sports_score;
  int toefl_score;
  int typeFood_score;
  int vegetable_score;
  int verbs_score;
  int weather_score;
  int workshop_score;
  UserScores({
    this.adjective_score,
    this.carPart_score,
    this.clothes_score,
    this.color_score,
    this.countries_score,
    this.days_score,
    this.dbFood_score,
    this.environment_score,
    this.family_score,
    this.feeling_score,
    this.football_score,
    this.fruit_score,
    this.halloween_score,
    this.ielts_score,
    this.months_score,
    this.music_score,
    this.office_score,
    this.place_score,
    this.sports_score,
    this.toefl_score,
    this.typeFood_score,
    this.vegetable_score,
    this.verbs_score,
    this.weather_score,
    this.workshop_score,
  });

  UserScores copyWith({
    int adjective_score,
    int carPart_score,
    int clothes_score,
    int color_score,
    int countries_score,
    int days_score,
    int dbFood_score,
    int environment_score,
    int family_score,
    int feeling_score,
    int football_score,
    int fruit_score,
    int halloween_score,
    int ielts_score,
    int months_score,
    int music_score,
    int office_score,
    int place_score,
    int sports_score,
    inttoefl_score,
    int typeFood_score,
    int vegetable_score,
    int verbs_score,
    int weather_score,
    int workshop_score,
  }) {
    return UserScores(
      adjective_score: adjective_score ?? this.adjective_score,
      carPart_score: carPart_score ?? this.carPart_score,
      clothes_score: clothes_score ?? this.clothes_score,
      color_score: color_score ?? this.color_score,
      countries_score: countries_score ?? this.countries_score,
      days_score: days_score ?? this.days_score,
      dbFood_score: dbFood_score ?? this.dbFood_score,
      environment_score: environment_score ?? this.environment_score,
      family_score: family_score ?? this.family_score,
      feeling_score: feeling_score ?? this.feeling_score,
      football_score: football_score ?? this.football_score,
      fruit_score: fruit_score ?? this.fruit_score,
      halloween_score: halloween_score ?? this.halloween_score,
      ielts_score: ielts_score ?? this.ielts_score,
      months_score: months_score ?? this.months_score,
      music_score: music_score ?? this.music_score,
      office_score: office_score ?? this.office_score,
      place_score: place_score ?? this.place_score,
      sports_score: sports_score ?? this.sports_score,
      toefl_score: toefl_score ?? this.toefl_score,
      typeFood_score: typeFood_score ?? this.typeFood_score,
      vegetable_score: vegetable_score ?? this.vegetable_score,
      verbs_score: verbs_score ?? this.verbs_score,
      weather_score: weather_score ?? this.weather_score,
      workshop_score: workshop_score ?? this.workshop_score,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'adjective_score': adjective_score,
      'carPart_score': carPart_score,
      'clothes_score': clothes_score,
      'color_score': color_score,
      'countries_score': countries_score,
      'days_score': days_score,
      'dbFood_score': dbFood_score,
      'environment_score': environment_score,
      'family_score': family_score,
      'feeling_score': feeling_score,
      'football_score': football_score,
      'fruit_score': fruit_score,
      'halloween_score': halloween_score,
      'ielts_score': ielts_score,
      'months_score': months_score,
      'music_score': music_score,
      'office_score': office_score,
      'place_score': place_score,
      'sports_score': sports_score,
      'toefl_score': toefl_score,
      'typeFood_score': typeFood_score,
      'vegetable_score': vegetable_score,
      'verbs_score': verbs_score,
      'weather_score': weather_score,
      'workshop_score': workshop_score,
    };
  }

  factory UserScores.fromMap(Map<String, dynamic> map) {
    return UserScores(
      adjective_score: map['adjective_score'],
      carPart_score: map['carPart_score'],
      clothes_score: map['clothes_score'],
      color_score: map['color_score'],
      countries_score: map['countries_score'],
      days_score: map['days_score'],
      dbFood_score: map['dbFood_score'],
      environment_score: map['environment_score'],
      family_score: map['family_score'],
      feeling_score: map['feeling_score'],
      football_score: map['football_score'],
      fruit_score: map['fruit_score'],
      halloween_score: map['halloween_score'],
      ielts_score: map['ielts_score'],
      months_score: map['months_score'],
      music_score: map['music_score'],
      office_score: map['office_score'],
      place_score: map['place_score'],
      sports_score: map['sports_score'],
      toefl_score: map['toefl_score'],
      typeFood_score: map['typeFood_score'],
      vegetable_score: map['vegetable_score'],
      verbs_score: map['verbs_score'],
      weather_score: map['weather_score'],
      workshop_score: map['workshop_score'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserScores.fromJson(String source) =>
      UserScores.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserScores(adjective_score: $adjective_score, carPart_score: $carPart_score, clothes_score: $clothes_score, color_score: $color_score, countries_score: $countries_score, days_score: $days_score, dbFood_score: $dbFood_score, environment_score: $environment_score, family_score: $family_score, feeling_score: $feeling_score, football_score: $football_score, fruit_score: $fruit_score, halloween_score: $halloween_score, ielts_score: $ielts_score, months_score: $months_score, music_score: $music_score, office_score: $office_score, place_score: $place_score, sports_score: $sports_score, toefl_score: $toefl_score, typeFood_score: $typeFood_score, vegetable_score: $vegetable_score, verbs_score: $verbs_score, weather_score: $weather_score, workshop_score: $workshop_score)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserScores &&
        other.adjective_score == adjective_score &&
        other.carPart_score == carPart_score &&
        other.clothes_score == clothes_score &&
        other.color_score == color_score &&
        other.countries_score == countries_score &&
        other.days_score == days_score &&
        other.dbFood_score == dbFood_score &&
        other.environment_score == environment_score &&
        other.family_score == family_score &&
        other.feeling_score == feeling_score &&
        other.football_score == football_score &&
        other.fruit_score == fruit_score &&
        other.halloween_score == halloween_score &&
        other.ielts_score == ielts_score &&
        other.months_score == months_score &&
        other.music_score == music_score &&
        other.office_score == office_score &&
        other.place_score == place_score &&
        other.sports_score == sports_score &&
        other.toefl_score == toefl_score &&
        other.typeFood_score == typeFood_score &&
        other.vegetable_score == vegetable_score &&
        other.verbs_score == verbs_score &&
        other.weather_score == weather_score &&
        other.workshop_score == workshop_score;
  }

  @override
  int get hashCode {
    return adjective_score.hashCode ^
        carPart_score.hashCode ^
        clothes_score.hashCode ^
        color_score.hashCode ^
        countries_score.hashCode ^
        days_score.hashCode ^
        dbFood_score.hashCode ^
        environment_score.hashCode ^
        family_score.hashCode ^
        feeling_score.hashCode ^
        football_score.hashCode ^
        fruit_score.hashCode ^
        halloween_score.hashCode ^
        ielts_score.hashCode ^
        months_score.hashCode ^
        music_score.hashCode ^
        office_score.hashCode ^
        place_score.hashCode ^
        sports_score.hashCode ^
        toefl_score.hashCode ^
        typeFood_score.hashCode ^
        vegetable_score.hashCode ^
        verbs_score.hashCode ^
        weather_score.hashCode ^
        workshop_score.hashCode;
  }
}
