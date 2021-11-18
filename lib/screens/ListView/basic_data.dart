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

final allBooks = <Book>[
  Book(
    id: 1,
    level: '(Basic)',
    title: 'Colors',
    urlImage:
        "https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Fcolors.png?alt=media&token=bede6c51-1b49-439c-8eb0-5017ce97471a",
    screen: Flash_Color(),
  ),
  Book(
    id: 2,
    level: '(Basic)',
    title: 'Fruits',
    urlImage:
        'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Ffruits.png?alt=media&token=548254ec-fbf7-428d-aa57-a1b23beacf56',
    screen: Flash_Fruit(),
  ),
  Book(
    id: 3,
    level: '(Basic)',
    title: 'Family Member',
    urlImage:
        'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Ffamily.png?alt=media&token=212afaa0-f50c-412c-bad6-3b8e5c4294eb',
    screen: Flash_Family(),
  ),
  Book(
    id: 4,
    level: '(Basic)',
    title: 'Countries & Nationalities',
    urlImage:
        'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Fcountries.png?alt=media&token=2d07fb02-7f29-4014-aebb-2216d6db3b9a',
    screen: Flash_Countries(),
  ),
  Book(
    id: 5,
    level: '(Basic)',
    title: 'Vegetables',
    urlImage:
        'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Fvegetables.png?alt=media&token=9bfa4e9a-28b6-4716-9002-824d4944f364',
    screen: Flash_Vegetables(),
  ),
  Book(
    id: 6,
    level: '(Basic)',
    title: 'Days of the week',
    urlImage:
        'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Fdays.png?alt=media&token=5968463c-dbbe-43d1-a1c1-72b329eb81b7',
    screen: Flash_Days(),
  ),
  Book(
    id: 7,
    level: '(Basic)',
    title: 'Months of the Year',
    urlImage:
        'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Fmonth.png?alt=media&token=6b87e96f-8680-4221-93ca-4ed190452e02',
    screen: Flash_Months(),
  ),
  Book(
    id: 8,
    level: '(Basic)',
    title: 'Verbs',
    urlImage:
        'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Fverbs.png?alt=media&token=def35377-dc79-4845-9933-15d9160d3ed8',
    screen: Flash_Verbs(),
  ),
  Book(
    id: 9,
    level: '(Basic)',
    title: 'Adjectives',
    urlImage:
        'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Fadjectives.png?alt=media&token=dde08a2b-dbc7-4666-a5b7-898d2dfcff17',
    screen: Flash_Adjectives(),
  ),
];
