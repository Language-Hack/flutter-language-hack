import 'package:language_hack/model/book.dart';
import 'package:language_hack/screens/basic_vocab/flash_card_adjectives.dart';
import 'package:language_hack/screens/basic_vocab/flash_card_color.dart';
import 'package:language_hack/screens/basic_vocab/flash_card_countries.dart';
import 'package:language_hack/screens/basic_vocab/flash_card_day.dart';
import 'package:language_hack/screens/basic_vocab/flash_card_family.dart';
import 'package:language_hack/screens/basic_vocab/flash_card_fruit.dart';
import 'package:language_hack/screens/basic_vocab/flash_card_months.dart';
import 'package:language_hack/screens/basic_vocab/flash_card_vegetables.dart';
import 'package:language_hack/screens/basic_vocab/flash_card_verbs.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_clothes.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_describing_food.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_foodtype.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_football.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_halloween.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_music.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_office_equip.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_sports.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_weather.dart';
import 'package:language_hack/screens/advanced_vocab/flash_card_environment.dart';
import 'package:language_hack/screens/advanced_vocab/flash_card_ielts.dart';
import 'package:language_hack/screens/advanced_vocab/flash_card_parts_of_car.dart';
import 'package:language_hack/screens/advanced_vocab/flash_card_toefl.dart';
import 'package:language_hack/screens/advanced_vocab/flash_card_workshop.dart';

final allBooks = <Book>[
  Book(
    id: 1,
    level: '(Basic)',
    title: 'Adjectives',
    urlImage:
        'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Fadjectives.png?alt=media&token=dde08a2b-dbc7-4666-a5b7-898d2dfcff17',
    screen: Flash_Adjectives(),
    score: 0,
  ),
  Book(
    id: 2,
    level: '(Basic)',
    title: 'Colors',
    urlImage:
        "https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Fcolors.png?alt=media&token=bede6c51-1b49-439c-8eb0-5017ce97471a",
    screen: Flash_Color(),
    score: 0,
  ),
  Book(
    id: 3,
    level: '(Basic)',
    title: 'Countries',
    urlImage:
        'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Fcountries.png?alt=media&token=2d07fb02-7f29-4014-aebb-2216d6db3b9a',
    screen: Flash_Countries(),
    score: 0,
  ),
  Book(
    id: 4,
    level: '(Basic)',
    title: 'Days of the week',
    urlImage:
        'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Fdays.png?alt=media&token=5968463c-dbbe-43d1-a1c1-72b329eb81b7',
    screen: Flash_Days(),
    score: 0,
  ),
  Book(
    id: 5,
    level: '(Basic)',
    title: 'Family Member',
    urlImage:
        'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Ffamily.png?alt=media&token=212afaa0-f50c-412c-bad6-3b8e5c4294eb',
    screen: Flash_Family(),
    score: 0,
  ),
  Book(
    id: 6,
    level: '(Basic)',
    title: 'Fruits',
    urlImage:
        'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Ffruits.png?alt=media&token=548254ec-fbf7-428d-aa57-a1b23beacf56',
    screen: Flash_Fruit(),
    score: 0,
  ),
  Book(
    id: 7,
    level: '(Basic)',
    title: 'Months of the Year',
    urlImage:
        'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Fmonth.png?alt=media&token=6b87e96f-8680-4221-93ca-4ed190452e02',
    screen: Flash_Months(),
    score: 0,
  ),
  Book(
    id: 8,
    level: '(Basic)',
    title: 'Vegetables',
    urlImage:
        'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Fvegetables.png?alt=media&token=9bfa4e9a-28b6-4716-9002-824d4944f364',
    screen: Flash_Vegetables(),
    score: 0,
  ),
  Book(
    id: 9,
    level: '(Basic)',
    title: 'Verbs',
    urlImage:
        'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Fverbs.png?alt=media&token=def35377-dc79-4845-9933-15d9160d3ed8',
    screen: Flash_Verbs(),
    score: 0,
  ),
  Book(
    id: 10,
    level: '(Intermediate)',
    title: 'Clothes',
    urlImage:
        'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Fclothes.png?alt=media&token=541f2fc3-532a-4942-9bb1-7ef03853d790',
    screen: Flash_Clothes(),
    score: 0,
  ),
  Book(
    id: 11,
    level: '(Intermediate)',
    title: 'Describing Food',
    urlImage:
        'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Ffoods.png?alt=media&token=6c0e4a42-a883-4e42-a860-9aae46228db7',
    screen: Flash_DeFood(),
    score: 0,
  ),
  Book(
    id: 12,
    level: '(Intermediate)',
    title: 'Feelings and Emotions',
    urlImage:
        'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Femotions.png?alt=media&token=d0c7152f-861e-4933-9d8f-515110a04ad3',
    screen: Flash_Countries(),
    score: 0,
  ),
  Book(
    id: 13,
    level: '(Intermediate)',
    title: 'Types of Foods',
    urlImage:
        'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2FtypeOfFood.png?alt=media&token=2f031a70-4ea6-4e2a-bbf2-8b3166813787',
    screen: Flash_FoodType(),
    score: 0,
  ),
  Book(
    id: 14,
    level: '(Intermediate)',
    title: 'Foodball',
    urlImage:
        'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Ffootball.png?alt=media&token=a2535c9e-0d5c-4d12-b1ec-c575c08a7520',
    screen: Flash_Football(),
    score: 0,
  ),
  Book(
    id: 15,
    level: '(Intermediate)',
    title: 'Halloween',
    urlImage:
        'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Fhalloween.png?alt=media&token=51e9283c-8720-42ed-afb3-5f6d45eb1115',
    screen: Flash_Halloween(),
    score: 0,
  ),
  Book(
    id: 16,
    level: '(Intermediate)',
    title: 'Musical Instruments',
    urlImage:
        "https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2FmusicInstrument.png?alt=media&token=1bf7e73b-67f6-4242-b736-05f788b44fd8",
    screen: Flash_Music(),
    score: 0,
  ),
  Book(
    id: 17,
    level: '(Intermediate)',
    title: 'Office Equipment',
    urlImage:
        'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2FofficeEquipment.png?alt=media&token=d9f5562a-d479-458a-96df-f15c824d6f2a',
    screen: Flash_OfficeEquip(),
    score: 0,
  ),
  Book(
    id: 18,
    level: '(Intermediate)',
    title: 'Sports',
    urlImage:
        'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2FtypeOfSports.png?alt=media&token=65ff0840-2be7-41bd-b208-12ba94f2c65d',
    screen: Flash_Sports(),
    score: 0,
  ),
  Book(
    id: 19,
    level: '(Intermediate)',
    title: 'Weather',
    urlImage:
        'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Fweather.png?alt=media&token=e2f5e8f1-7344-4bac-930d-b2a2ac5dd92c',
    screen: Flash_Weather(),
    score: 0,
  ),
  Book(
    id: 20,
    level: '(Advanced)',
    title: 'The environment',
    urlImage:
        'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Fenvironment.png?alt=media&token=386129ad-7bed-4fb9-86ef-a4a8f457289e',
    screen: Flash_Environment(),
    score: 0,
  ),
  Book(
    id: 21,
    level: '(Advanced)',
    title: 'IELTS Academic Writing',
    urlImage:
        "https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Fielts.png?alt=media&token=48d81ba1-b317-414b-a1f6-3277c1962ccc",
    screen: Flash_IELTS(),
    score: 0,
  ),
  Book(
    id: 22,
    level: '(Advanced)',
    title: 'Parts of Car',
    urlImage:
        'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2FpartOfCars.png?alt=media&token=178d19b9-bae7-4bd5-a6b0-19d8a8b00ecc',
    screen: Flash_PartOfCar(),
    score: 0,
  ),
  Book(
    id: 23,
    level: '(Advanced)',
    title: 'TOEFL',
    urlImage:
        'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Ftoefl.png?alt=media&token=65d2fbef-7209-4482-ac1c-366dfdf84061',
    screen: Flash_Toelf(),
    score: 0,
  ),
  Book(
    id: 24,
    level: '(Advanced)',
    title: 'Workshop',
    urlImage:
        'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Fworkshop.png?alt=media&token=932f5a68-c452-41f3-84bc-b336dbd3c902',
    screen: Flash_Workshop(),
    score: 0,
  ),
];
