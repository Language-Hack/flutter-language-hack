import 'package:flutter/widgets.dart';
import 'package:language_hack/screens/advanced_vocab/flash_card_environment.dart';
import 'package:language_hack/screens/advanced_vocab/flash_card_ielts.dart';
import 'package:language_hack/screens/advanced_vocab/flash_card_parts_of_car.dart';
import 'package:language_hack/screens/advanced_vocab/flash_card_toefl.dart';
import 'package:language_hack/screens/advanced_vocab/flash_card_workshop.dart';
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
import 'package:language_hack/screens/intermediate_vocab/flash_card_feelings.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_foodtype.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_football.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_halloween.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_music.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_office_equip.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_sports.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_weather.dart';

Flash_Adjectives flash_adjectives = new Flash_Adjectives();
Flash_Color flash_color = new Flash_Color();
Flash_Countries flash_countries = new Flash_Countries();
Flash_Days flash_days = new Flash_Days();
Flash_Family flash_family = new Flash_Family();
Flash_Fruit flash_fruit = new Flash_Fruit();
Flash_Months flash_months = new Flash_Months();
Flash_Vegetables flash_vegetables = new Flash_Vegetables();
Flash_Verbs flash_verbs = new Flash_Verbs();
Flash_Clothes flash_clothes = new Flash_Clothes();
Flash_DeFood flash_deFood = new Flash_DeFood();
Flash_Feelings flash_feelings = new Flash_Feelings();
Flash_Football flash_football = new Flash_Football();
Flash_FoodType flash_foodType = new Flash_FoodType();
Flash_Halloween flash_halloween = new Flash_Halloween();
Flash_Music flash_music = new Flash_Music();
Flash_OfficeEquip flash_officeEquip = new Flash_OfficeEquip();
Flash_Sports flash_sports = new Flash_Sports();
Flash_Weather flash_weather = new Flash_Weather();
Flash_Environment flash_environment = new Flash_Environment();
Flash_IELTS flash_ielts = new Flash_IELTS();
Flash_PartOfCar flash_partOfCar = new Flash_PartOfCar();
Flash_Toelf flash_toelf = new Flash_Toelf();
Flash_Workshop flash_workshop = new Flash_Workshop();

List<Widget> basic_page = [
  flash_adjectives,
  flash_color,
  flash_countries,
  flash_days,
  flash_family,
  flash_fruit,
  flash_months,
  flash_vegetables,
  flash_verbs
];

List<String> basic_name = [
  'Adjectives',
  'Colors',
  'Countries',
  'Days',
  'Families',
  'Fruits',
  'Months',
  'Vegetables',
  'Verbs'
];

List<String> basic_image = [
  'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Fadjectives.png?alt=media&token=dde08a2b-dbc7-4666-a5b7-898d2dfcff17',
  'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Fcolors.png?alt=media&token=bede6c51-1b49-439c-8eb0-5017ce97471a',
  'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Fcountries.png?alt=media&token=2d07fb02-7f29-4014-aebb-2216d6db3b9a',
  'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Fdays.png?alt=media&token=5968463c-dbbe-43d1-a1c1-72b329eb81b7',
  'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Ffamily.png?alt=media&token=212afaa0-f50c-412c-bad6-3b8e5c4294eb',
  'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Ffruits.png?alt=media&token=548254ec-fbf7-428d-aa57-a1b23beacf56',
  'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Fmonth.png?alt=media&token=6b87e96f-8680-4221-93ca-4ed190452e02',
  'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Fvegetables.png?alt=media&token=9bfa4e9a-28b6-4716-9002-824d4944f364',
  'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Fverbs.png?alt=media&token=def35377-dc79-4845-9933-15d9160d3ed8'
];

List<Widget> intermediate_page = [
  flash_clothes,
  flash_deFood,
  flash_feelings,
  flash_foodType,
  flash_football,
  flash_halloween,
  flash_music,
  flash_officeEquip,
  flash_sports,
  flash_weather
];

List<String> intermediate_name = [
  'Clothes',
  'Foods',
  'Feelings',
  'Type of Foods',
  'Football',
  'Halloween',
  'Music',
  'Equipments',
  'Sports',
  'Weather'
];

List<String> intermediate_image = [
  'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Fclothes.png?alt=media&token=541f2fc3-532a-4942-9bb1-7ef03853d790',
  'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Ffoods.png?alt=media&token=6c0e4a42-a883-4e42-a860-9aae46228db7',
  'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Femotions.png?alt=media&token=d0c7152f-861e-4933-9d8f-515110a04ad3',
  'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2FtypeOfFood.png?alt=media&token=2f031a70-4ea6-4e2a-bbf2-8b3166813787',
  'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Ffootball.png?alt=media&token=a2535c9e-0d5c-4d12-b1ec-c575c08a7520',
  'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Fhalloween.png?alt=media&token=51e9283c-8720-42ed-afb3-5f6d45eb1115',
  'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2FmusicInstrument.png?alt=media&token=1bf7e73b-67f6-4242-b736-05f788b44fd8',
  'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2FofficeEquipment.png?alt=media&token=d9f5562a-d479-458a-96df-f15c824d6f2a',
  'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2FtypeOfSports.png?alt=media&token=65ff0840-2be7-41bd-b208-12ba94f2c65d',
  'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Fweather.png?alt=media&token=e2f5e8f1-7344-4bac-930d-b2a2ac5dd92c'
];

List<Widget> advance_page = [
  flash_environment,
  flash_ielts,
  flash_partOfCar,
  flash_toelf,
  flash_workshop
];

List<String> advance_name = [
  'Environment',
  'IELTS',
  'Parts of Car',
  'TOFEL',
  'Workshop'
];

List<String> advance_image = [
  'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Fenvironment.png?alt=media&token=386129ad-7bed-4fb9-86ef-a4a8f457289e',
  'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Fielts.png?alt=media&token=48d81ba1-b317-414b-a1f6-3277c1962ccc',
  'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2FpartOfCars.png?alt=media&token=178d19b9-bae7-4bd5-a6b0-19d8a8b00ecc',
  'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Ftoefl.png?alt=media&token=65d2fbef-7209-4482-ac1c-366dfdf84061',
  'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Fworkshop.png?alt=media&token=932f5a68-c452-41f3-84bc-b336dbd3c902'
];
