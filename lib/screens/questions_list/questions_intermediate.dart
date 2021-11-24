import 'package:language_hack/model/quiz.dart';
import 'package:language_hack/screens/questions_list/questions_method.dart';

List<Quiz> clothes = [
  randomQuestions('เข็มขัด', 'Belt', 'Belt (เข็มขัด)'),
  randomQuestions('เสื้อคลุม', 'Coat', 'Coat (เสื้อคลุม)'),
  randomQuestions('ถุงมือ', 'Gloves', 'Gloves (ถุงมือ)'),
  randomQuestions('กางเกงยีน', 'Jeans', 'Jeans (กางเกงยีน)'),
  randomQuestions('กางเกงขาสั้น', 'Shorts', 'Shorts (กางเกงขาสั้น)'),
  randomQuestions('ผ้าพันคอ', 'Scarf', 'Scarf (ผ้าพันคอ)'),
  randomQuestions('ถุงเท้าสั้น', 'Socks', 'Socks (ถุงเท้าสั้น)'),
  randomQuestions('หมวก', 'Hat', 'Hat (หมวก)'),
  randomQuestions('เสื้อเชิ้ต', 'Shirt', 'Shirt (เสื้อเชิ้ต)'),
  randomQuestions('กระโปรง', 'Skirt', 'Skirt (กระโปรง)'),
];

List<Quiz> dBFood = [
  randomQuestions('ขม', 'Bitter', 'Bitter (ขม)'),
  randomQuestions('กรอบ', 'Crunchy', 'Crunchy (กรอบ)'),
  randomQuestions('แห้ง', 'Dry', 'Dry (แห้ง)'),
  randomQuestions('ดีต่อสุขภาพ', 'Healthy', 'Healthy (ดีต่อสุขภาพ)'),
  randomQuestions(
    'ฉ่ำ',
    'Juicy',
    'Juicy (ฉ่ำ)',
  ),
  randomQuestions('เคี้ยวไม่ง่าย', 'Chewy', 'Chewy (เคี้ยวไม่ง่าย)'),
  randomQuestions('อร่อย', 'Delicious', 'Delicious (อร่อย)'),
  randomQuestions('สด', 'Fresh', 'Fresh (สด)'),
  randomQuestions('ร้อน,เผ็ด', 'Hot', 'Hot (ร้อน,เผ็ด)'),
  randomQuestions('กรอบ', 'Crispy', 'Crispy (กรอบ)'),
];

List<Quiz> feelings = [
  randomQuestions(
      'เป็นทุกข์,กลุ้มใจ', 'Worried', 'Worried (เป็นทุกข์,กลุ้มใจ)'),
  randomQuestions('ขอบคุณ', 'Thankful', 'Thankful (ขอบคุณ)'),
  randomQuestions('ก้าวร้าว', 'Aggressive', 'Aggressive (ก้าวร้าว)'),
  randomQuestions('มีความหวัง', 'Hopeful', 'Hopeful (มีความหวัง)'),
  randomQuestions('น่าเบื่อ', 'Bored', 'Bored (น่าเบื่อ)'),
  randomQuestions('ขี้อาย', 'Shy', 'Shy (ขี้อาย)'),
  randomQuestions('อยากรู้อยากเห็น', 'Curious', 'Curious (อยากรู้อยากเห็น)'),
  randomQuestions('ตึงเครียด', 'Tense', 'Tense (ตึงเครียด)'),
  randomQuestions('ภูมิใจ', 'Proud', 'Proud (ภูมิใจ)'),
  randomQuestions('เศร้า', 'Sad', 'Sad (เศร้า)'),
];

List<Quiz> foodType = [
  randomQuestions('ของหวาน', 'Dessert', 'Dessert (ของหวาน)'),
  randomQuestions('อาหารทะเล', 'Seafood', 'Seafood (อาหารทะเล)'),
  randomQuestions('ผลิตภัณฑ์ที่ทำจากนม', 'Dairy Products',
      'Dairy Products (ผลิตภัณฑ์ที่ทำจากนม)'),
  randomQuestions('เนื้อสัตว์', 'Meat', 'Meat (เนื้อสัตว์)'),
  randomQuestions('ผลไม้', 'Vegetables', 'Vegetables (ผลไม้)'),
  randomQuestions('ของหวาน', 'Dessert', 'Dessert (ของหวาน)'),
  randomQuestions('อาหารทะเล', 'Seafood', 'Seafood (อาหารทะเล)'),
  randomQuestions('ผลิตภัณฑ์ที่ทำจากนม', 'Dairy Products',
      'Dairy Products (ผลิตภัณฑ์ที่ทำจากนม)'),
  randomQuestions('เนื้อสัตว์', 'Meat', 'Meat (เนื้อสัตว์)'),
  randomQuestions('ผลไม้', 'Vegetables', 'Vegetables (ผลไม้)'),
];

List<Quiz> football = [
  randomQuestions(
      'การเตะลูกโทษ', 'Penalty kick', 'Penalty kick (การเตะลูกโทษ)'),
  randomQuestions('ผู้ตัดสิน', 'Referee', 'Referee (ผู้ตัดสิน)'),
  randomQuestions('ใบแดง', 'Red card', 'Red card (ใบแดง)'),
  randomQuestions('ที่นั่งสำหรับนักกีฬาตัวสำรอง', 'Bench',
      'Bench (ที่นั่งสำหรับนักกีฬาตัวสำรอง)'),
  randomQuestions('ผู้จัดการทีม', 'Manager', 'Manager (ผู้จัดการทีม)'),
  randomQuestions(
      'นักฟุตบอล', 'Football Players', 'Football Players (นักฟุตบอล)'),
  randomQuestions('ผู้รักษาประตู', 'Goalkeeper', 'Goalkeeper (ผู้รักษาประตู)'),
  randomQuestions('ใบเหลือง', 'Yellow card', 'Yellow card (ใบเหลือง)'),
  randomQuestions('สับเปลี่ยน', 'Substitute', 'Substitute (สับเปลี่ยน)'),
  randomQuestions('ผู้กำกับเส้น', 'Linesman', 'Linesman (ผู้กำกับเส้น)'),
];

List<Quiz> halloween = [
  randomQuestions('ค้างคาว', 'Bat', 'Bat (ค้างคาว)'),
  randomQuestions('นกฮูก', 'Owl', 'Owl (นกฮูก)'),
  randomQuestions('พ่อมด', 'Wizard', 'Wizard (พ่อมด)'),
  randomQuestions('มัมมี่', 'Mummy', 'Mummy (มัมมี่)'),
  randomQuestions('ผีดูดเลือด', 'Vampire', 'Vampire (ผีดูดเลือด)'),
  randomQuestions('ซอมบี้', 'Zombies', 'Zombies (ซอมบี้)'),
  randomQuestions('แมงมุม', 'Spider', 'Spider (แมงมุม)'),
  randomQuestions('ผี', 'Ghost', 'Ghost (ผี)'),
  randomQuestions('โครงกระดูก', 'Skeleton', 'Skeleton (โครงกระดูก)'),
  randomQuestions('แม่มด', 'Witches', 'Witches (แม่มด)'),
];

List<Quiz> music = [
  randomQuestions('เปียโน', 'Piano', 'Piano (เปียโน)'),
  randomQuestions('ไวโอลิน', 'Violin', 'Violin (ไวโอลิน)'),
  randomQuestions('กลอง', 'Drums', 'Drums (กลอง)'),
  randomQuestions('แซ็กโซโฟน', 'Saxophone', 'Saxophone (แซ็กโซโฟน)'),
  randomQuestions('หีบเพลงเป่า', 'Harmonica', 'Harmonica (หีบเพลงเป่า)'),
  randomQuestions('แตร', 'Trumpet', 'Trumpet (แตร)'),
  randomQuestions('กีตาร์', 'Guitar', 'Guitar (กีตาร์)'),
  randomQuestions('ขลุ่ย', 'Flute', 'Flute (ขลุ่ย)'),
  randomQuestions('หีบเพลง', 'Accordion', 'Accordion (หีบเพลง)'),
  randomQuestions('แบนโจ', 'Banjo', 'Banjo (แบนโจ)'),
];

List<Quiz> office = [
  randomQuestions('ไม้บรรทัด', 'Ruler', 'Ruler (ไม้บรรทัด)'),
  randomQuestions('เครื่องคิดเลข', 'Calculator', 'Calculator (เครื่องคิดเลข)'),
  randomQuestions('เครื่องคิดเลข', 'Calculator', 'Calculator (เครื่องคิดเลข)'),
  randomQuestions('ปากกา', 'Pen', 'Pen (ปากกา)'),
  randomQuestions('กรรไกร', 'Scissors', 'Scissors (กรรไกร)'),
  randomQuestions('กรรไกร', 'Scissors', 'Scissors (กรรไกร)'),
  randomQuestions('ที่เย็บกระดาษ', 'Stapler', 'Stapler (ที่เย็บกระดาษ)'),
  randomQuestions('ดินสอ', 'Pencil', 'Pencil (ดินสอ)'),
  randomQuestions('ดินสอ', 'Pencil', 'Pencil (ดินสอ)'),
  randomQuestions('ยางลบ', 'Eraser', 'Eraser (ยางลบ)'),
];

List<Quiz> sport = [
  randomQuestions('กีฬาฟุตบอล', 'Football', 'Football (กีฬาฟุตบอล)'),
  randomQuestions('บาสเกตบอล', 'Basketball', 'Basketball (บาสเกตบอล)'),
  randomQuestions('ดำน้ำ', 'Diving', 'Diving (ดำน้ำ)'),
  randomQuestions('กีฬาฟุตบอล', 'Football', 'Football (กีฬาฟุตบอล)'),
  randomQuestions('บาสเกตบอล', 'Basketball', 'Basketball (บาสเกตบอล)'),
  randomQuestions('ดำน้ำ', 'Diving', 'Diving (ดำน้ำ)'),
  randomQuestions('แบดมินตัน', 'Badminton', 'Badminton (แบดมินตัน)'),
  randomQuestions('กีฬาเบสบอล', 'Baseball', 'Baseball (กีฬาเบสบอล)'),
  randomQuestions('ว่ายน้ำ', 'Swimming', 'Swimming (ว่ายน้ำ)'),
  randomQuestions('กีฬากอล์ฟ', 'Golf', 'Golf (กีฬากอล์ฟ)'),
];

List<Quiz> weather = [
  randomQuestions('มีแสงแดดมาก', 'Sunny', 'Sunny (มีแสงแดดมาก)'),
  randomQuestions('หมอก', 'Fog', 'Fog (หมอก)'),
  randomQuestions('ปกคลุมด้วยหิมะ', 'Snow', 'Snow (ปกคลุมด้วยหิมะ)'),
  randomQuestions('ปกคลุมด้วยเมฆ', 'Cloudy', 'Cloudy (ปกคลุมด้วยเมฆ)'),
  randomQuestions('ฝน', 'Rain', 'Rain (ฝน)'),
  randomQuestions('มีลมแรง', 'Windy', 'Windy (มีลมแรง)'),
  randomQuestions('ปกคลุมด้วยหิมะ', 'Snow', 'Snow (ปกคลุมด้วยหิมะ)'),
  randomQuestions('ปกคลุมด้วยเมฆ', 'Cloudy', 'Cloudy (ปกคลุมด้วยเมฆ)'),
  randomQuestions('ฝน', 'Rain', 'Rain (ฝน)'),
  randomQuestions('มีลมแรง', 'Windy', 'Windy (มีลมแรง)'),
];
