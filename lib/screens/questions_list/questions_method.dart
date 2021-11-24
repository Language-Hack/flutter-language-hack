import 'dart:math';
import 'package:language_hack/model/quiz.dart';

final String englishToThai = 'Translate this word:';
final String thaiToEnglish = 'Translate this word:';
final String fillBlank = 'Spell this word:';

Map<String, bool> randomEnglish(String value) {
  Map<String, bool> pickedAnswer = {};
  List pk = [];
  List allAnswers = [
    'แอปเปิ้ล',
    'เชอรี่',
    'มะพร้าว',
    'กล้วย',
    'สีแดง',
    'สีขาว',
    'ปากกา',
    'ดินสอ',
    'กรรไกร',
    'ประตู',
    'ไม้',
    'มหาสมุทร',
    'ฝน',
    'การเพิ่มขึ้น',
    'ล้อ',
    'ผ้าพันคอ',
    'โครงกระดูก',
    'วันอาทิตย์'
  ];
  pk.add(value);
  for (int i = 0; i < 4; i++) {
    allAnswers.shuffle();
    int index = Random().nextInt(allAnswers.length);
    var randomElement = allAnswers[index];
    allAnswers.removeAt(index);
    if (randomElement != value && pk.length < 4) {
      pk.add(randomElement);
    }
  }
  pk.shuffle();
  for (var item in pk) {
    if (item != value) {
      pickedAnswer[item] = false;
    } else {
      pickedAnswer[item] = true;
    }
  }
  return pickedAnswer;
}

Map<String, bool> randomThai(String value) {
  Map<String, bool> pickedAnswer = {};
  List pk = [];
  List allAnswers = [
    'Apple',
    'Cherry',
    'Coconut',
    'Banana',
    'Red',
    'White',
    'Pen',
    'Pencil',
    'Calculator',
    'Wood',
    'Ocean',
    'Rain',
    'Increase',
    'Wheel',
    'Scarf',
    'Skeleton',
    'Sunday'
  ];
  pk.add(value);
  for (int i = 0; i < 4; i++) {
    allAnswers.shuffle();
    int index = Random().nextInt(allAnswers.length);
    var randomElement = allAnswers[index];
    allAnswers.removeAt(index);
    if (randomElement != value && pk.length < 4) {
      pk.add(randomElement);
    }
  }
  pk.shuffle();
  for (var item in pk) {
    if (item != value) {
      pickedAnswer[item] = false;
    } else {
      pickedAnswer[item] = true;
    }
  }
  return pickedAnswer;
}

Map<String, bool> randomBlank(String value) {
  Map<String, bool> pickedAnswer = {};
  List pk = [];
  List allAnswers = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z'
  ];
  pk.add(value);
  for (int i = 0; i < 4; i++) {
    allAnswers.shuffle();
    int index = Random().nextInt(allAnswers.length);
    var randomElement = allAnswers[index];
    allAnswers.removeAt(index);
    if (randomElement != value && pk.length < 4) {
      pk.add(randomElement);
    }
  }
  pk.shuffle();
  for (var item in pk) {
    if (item != value) {
      pickedAnswer[item] = false;
    } else {
      pickedAnswer[item] = true;
    }
  }
  return pickedAnswer;
}

String randomAlphabetBlank(String value) {
  var arr = value.split('');

  var random = new Random();

  return arr[random.nextInt(arr.length)].toLowerCase();
}

String replaceAlphabetBlank(String value, String alphabet) {
  var split = value.split('');

  if (split[0] != alphabet.toUpperCase()) {
    var lowerCase = value;
    var new_val = lowerCase.replaceAll(alphabet, '_');

    return new_val;
  }

  var lowerCase = value.toLowerCase();
  var new_val = lowerCase.replaceAll(alphabet, '_');

  return new_val;
}

Quiz randomQuestions(String valueThai, String valueEng, String valueBlank) {
  var random = new Random();
  String question = '';
  if (random.nextInt(3) == 0) {
    question = valueThai;
    return Quiz(question, randomThai(valueEng), thaiToEnglish);
  } else if (random.nextInt(3) == 1) {
    question = valueEng;
    return Quiz(question, randomEnglish(valueThai), englishToThai);
  } else {
    var randomAlphabet = randomAlphabetBlank(valueEng);
    var blankWord = replaceAlphabetBlank(valueBlank, randomAlphabet);
    return Quiz(blankWord, randomBlank(randomAlphabet), fillBlank);
  }
}
