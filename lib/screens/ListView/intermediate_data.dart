import 'package:language_hack/model/book.dart';
import 'package:language_hack/screens/basic_vocab/flash_card_countries.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_clothes.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_describing_food.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_foodtype.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_football.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_halloween.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_music.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_office_equip.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_sports.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_weather.dart';

final allBooks2 = <Book>[
  Book(
    id: 1,
    level: '(Intermediate)',
    title: 'Musical Instruments',
    urlImage:
        "https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2FmusicInstrument.png?alt=media&token=1bf7e73b-67f6-4242-b736-05f788b44fd8",
    screen: Flash_Music(),
  ),
  Book(
    id: 2,
    level: '(Intermediate)',
    title: 'Clothes',
    urlImage:
        'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Fclothes.png?alt=media&token=541f2fc3-532a-4942-9bb1-7ef03853d790',
    screen: Flash_Clothes(),
  ),
  Book(
    id: 3,
    level: '(Intermediate)',
    title: 'Describing Food',
    urlImage:
        'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Ffoods.png?alt=media&token=6c0e4a42-a883-4e42-a860-9aae46228db7',
    screen: Flash_DeFood(),
  ),
  Book(
    id: 4,
    level: '(Intermediate)',
    title: 'Feelings and Emotions',
    urlImage:
        'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Femotions.png?alt=media&token=d0c7152f-861e-4933-9d8f-515110a04ad3',
    screen: Flash_Countries(),
  ),
  Book(
    id: 5,
    level: '(Intermediate)',
    title: 'Types of Foods',
    urlImage:
        'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2FtypeOfFood.png?alt=media&token=2f031a70-4ea6-4e2a-bbf2-8b3166813787',
    screen: Flash_FoodType(),
  ),
  Book(
    id: 6,
    level: '(Intermediate)',
    title: 'Foodball',
    urlImage:
        'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Ffootball.png?alt=media&token=a2535c9e-0d5c-4d12-b1ec-c575c08a7520',
    screen: Flash_Football(),
  ),
  Book(
    id: 7,
    level: '(Intermediate)',
    title: 'Halloween',
    urlImage:
        'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Fhalloween.png?alt=media&token=51e9283c-8720-42ed-afb3-5f6d45eb1115',
    screen: Flash_Halloween(),
  ),
  Book(
    id: 8,
    level: '(Intermediate)',
    title: 'Office Equipment',
    urlImage:
        'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2FofficeEquipment.png?alt=media&token=d9f5562a-d479-458a-96df-f15c824d6f2a',
    screen: Flash_OfficeEquip(),
  ),
  Book(
    id: 9,
    level: '(Intermediate)',
    title: 'Sports',
    urlImage:
        'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2FtypeOfSports.png?alt=media&token=65ff0840-2be7-41bd-b208-12ba94f2c65d',
    screen: Flash_Sports(),
  ),
  Book(
    id: 10,
    level: '(Intermediate)',
    title: 'Weather',
    urlImage:
        'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Fweather.png?alt=media&token=e2f5e8f1-7344-4bac-930d-b2a2ac5dd92c',
    screen: Flash_Weather(),
  ),
];
