import 'package:language_hack/model/book.dart';
import 'package:language_hack/screens/advanced_vocab/flash_card_environment.dart';
import 'package:language_hack/screens/advanced_vocab/flash_card_ielts.dart';
import 'package:language_hack/screens/advanced_vocab/flash_card_parts_of_car.dart';
import 'package:language_hack/screens/advanced_vocab/flash_card_toefl.dart';
import 'package:language_hack/screens/advanced_vocab/flash_card_workshop.dart';

final allBooks3 = <Book>[
  Book(
    id: 1,
    level: '(Advanced)',
    title: 'IELTS Academic Writing',
    urlImage:
        "https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Fielts.png?alt=media&token=48d81ba1-b317-414b-a1f6-3277c1962ccc",
    screen: Flash_IELTS(),
  ),
  Book(
    id: 2,
    level: '(Advanced)',
    title: 'The environment',
    urlImage:
        'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Fenvironment.png?alt=media&token=386129ad-7bed-4fb9-86ef-a4a8f457289e',
    screen: Flash_Environment(),
  ),
  Book(
    id: 3,
    level: '(Advanced)',
    title: 'Parts of Car',
    urlImage:
        'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2FpartOfCars.png?alt=media&token=178d19b9-bae7-4bd5-a6b0-19d8a8b00ecc',
    screen: Flash_PartOfCar(),
  ),
  Book(
    id: 4,
    level: '(Advanced)',
    title: 'Workshop',
    urlImage:
        'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Fworkshop.png?alt=media&token=932f5a68-c452-41f3-84bc-b336dbd3c902',
    screen: Flash_Workshop(),
  ),
  Book(
    id: 5,
    level: '(Advanced)',
    title: 'TOEFL',
    urlImage:
        'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Ftoefl.png?alt=media&token=65d2fbef-7209-4482-ac1c-366dfdf84061',
    screen: Flash_Toelf(),
  ),
];
