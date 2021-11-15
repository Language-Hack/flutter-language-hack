import 'package:language_hack/model/quiz.dart';
import 'package:language_hack/screens/questions_list/questions_method.dart';

List<Quiz> adjectives = [
  randomQuestions('มีความสุข', 'Happy', 'Happy (มีความสุข)'),
  randomQuestions('สวยงาม', 'Beautiful', 'Beautiful (สวยงาม)'),
  randomQuestions('น่าเกลียด', 'Ugly', 'Ugly (น่าเกลียด)'),
  randomQuestions('เศร้า', 'Sad', 'Sad (เศร้า)'),
  randomQuestions('เสียงดัง', 'Noisy', 'Noisy (เสียงดัง)'),
  randomQuestions('เงียบ', 'Quiet', 'Quiet (เงียบ)'),
  randomQuestions('แข็งแรง', 'Strong', 'Strong (แข็งแรง)'),
  randomQuestions('อ่อนแอ', 'Weak', 'Weak (อ่อนแอ)'),
  randomQuestions(
    'สาย',
    'Late',
    'Late (สาย)',
  ),
  randomQuestions(
      'ก่อนเวลาที่กำหนดไว้', 'Early', 'Early (ก่อนเวลาที่กำหนดไว้)'),
];

List<Quiz> colors = [
  randomQuestions("สีส้ม", "Orange", "Orange (สีส้ม)"),
  randomQuestions('สีเหลือง', 'Yellow', 'Yellow (สีเหลือง)'),
  randomQuestions('สีแดง', 'Red', 'Red (สีแดง)'),
  randomQuestions('สีขาว', 'White', 'White (สีขาว)'),
  randomQuestions('สีน้ำตาล', 'Brown', 'Brown (สีน้ำตาล)'),
  randomQuestions('สีม่วง', 'Purple', 'Purple (สีม่วง)'),
  randomQuestions('สีชมพู', 'Pink', 'Pink (สีชมพู)'),
  randomQuestions('สีดำ', 'Black', 'Black (สีดำ)'),
  randomQuestions('สีฟ้า', 'Blue', 'Blue (สีฟ้า)'),
  randomQuestions('สีเขียว', 'Green', 'Green (สีเขียว)'),
];

List<Quiz> countries = [
  randomQuestions(
      'ประเทศอาร์เจนตินา', 'Argentina', 'Argentina (ประเทศอาร์เจนตินา)'),
  randomQuestions('ประเทศเบลเยียม', 'Belgium', 'Belgium (ประเทศเบลเยียม)'),
  randomQuestions('ประเทศญี่ปุ่น', 'Japan', 'Japan (ประเทศญี่ปุ่น)'),
  randomQuestions('ประเทศมาเลเซีย', 'Malaysia', 'Malaysia (ประเทศมาเลเซีย)'),
  randomQuestions('ประเทศไทย', 'Thailand', 'Thailand (ประเทศไทย)'),
  randomQuestions(
      'ประเทศออสเตรเลีย', 'Australia', 'Australia (ประเทศออสเตรเลีย)'),
  randomQuestions('ประเทศจีน', 'China', 'China (ประเทศจีน)'),
  randomQuestions('ประเทศอังกฤษ', 'England', 'England (ประเทศอังกฤษ)'),
  randomQuestions('ประเทศฝรั่งเศส', 'France', 'France (ประเทศฝรั่งเศส)'),
  randomQuestions('ประเทศอินเดีย', 'India', 'India (ประเทศอินเดีย)'),
];

List<Quiz> day = [
  randomQuestions('วันจันทร์', 'Monday', 'Monday (วันจันทร์)'),
  randomQuestions('วันอังคาร', 'Tuesday', 'Tuesday (วันอังคาร)'),
  randomQuestions('วันพุธ', 'Wednesday', 'Wednesday (วันพุธ)'),
  randomQuestions('วันพฤหัสบดี', 'Thursday', 'Thursday (วันพฤหัสบดี)'),
  randomQuestions('วันศุกร์', 'Friday', 'Friday (วันศุกร์)'),
  randomQuestions('วันเสาร์', 'Saturday', 'Saturday (วันเสาร์)'),
  randomQuestions('วันอาทิตย์', 'Sunday', 'Sunday (วันอาทิตย์)'),
];

List<Quiz> family = [
  randomQuestions('พ่อ', 'Father', 'Father (พ่อ)'),
  randomQuestions('ลูกชาย', 'Son', 'Son (ลูกชาย)'),
  randomQuestions('พี่ชาย/น้องชาย', 'Brother', 'Brother (พี่ชาย/น้องชาย)'),
  randomQuestions('ปู่', 'Grandfather', 'Grandfather (ปู่)'),
  randomQuestions('ลุง', 'Uncle', 'Uncle (ลุง)'),
  randomQuestions('แม่', 'Mother', 'Mother (แม่)'),
  randomQuestions('ลูกสาว', 'Daughter', 'Daughter (ลูกสาว)'),
  randomQuestions('พี่สาว/น้องสาว', 'Sister', 'Sister (พี่สาว/น้องสาว)'),
  randomQuestions('ย่า', 'Grandmother', 'Grandmother (ย่า)'),
  randomQuestions('ป้า', 'Aunt', 'Aunt (ป้า)'),
];

List<Quiz> fruit = [
  randomQuestions('แอปเปิ้ล', 'Apple', 'Apple (แอปเปิ้ล)'),
  randomQuestions('เชอรี่', 'Cherry', 'Cherry (เชอรี่)'),
  randomQuestions('มะพร้าว', 'Coconut', 'Coconut (มะพร้าว)'),
  randomQuestions('มะนาว', 'Lemon', 'Lemon (มะนาว)'),
  randomQuestions('มะม่วง', 'Mango', 'Mango (มะม่วง)'),
  randomQuestions('กล้วย', 'Banana', 'Banana (กล้วย)'),
  randomQuestions('องุ่น', 'Grape', 'Grape (องุ่น)'),
  randomQuestions('สัปปะรด', 'Pineapple', 'Pineapple (สัปปะรด)'),
  randomQuestions('สตรอว์เบอร์รี', 'Strawberry', 'Strawberry (สตรอว์เบอร์รี)'),
  randomQuestions('แตงโม', 'Watermelon', 'Watermelon (แตงโม)'),
];

List<Quiz> month = [
  randomQuestions('เดือนมกราคม', 'January', 'January (เดือนมกราคม)'),
  randomQuestions('เดือนกุมภาพันธ์', 'February', 'February (เดือนกุมภาพันธ์)'),
  randomQuestions('เดือนมีนาคม', 'March', 'March (เดือนมีนาคม)'),
  randomQuestions('เดือนเมษายน', 'April', 'April (เดือนเมษายน)'),
  randomQuestions('เดือนพฤษภาคม', 'May', 'May (เดือนพฤษภาคม)'),
  randomQuestions('เดือนมิถุนายน', 'June', 'June (เดือนมิถุนายน)'),
  randomQuestions('เดือนกรกฎาคม', 'July', 'July (เดือนกรกฎาคม)'),
  randomQuestions('เดือนสิงหาคม', 'August', 'August (เดือนสิงหาคม)'),
  randomQuestions('เดือนกันยายน', 'September', 'September (เดือนกันยายน)'),
  randomQuestions('เดือนตุลาคม', 'October', 'October (เดือนตุลาคม)'),
  randomQuestions('เดือนพฤศจิกายน', 'November', 'November (เดือนพฤศจิกายน)'),
  randomQuestions('เดือนธันวาคม', 'December', 'December (เดือนธันวาคม)'),
];

List<Quiz> vegetable = [
  randomQuestions('บีทรูท', 'Beetroot', 'Beetroot (บีทรูท)'),
  randomQuestions('แครอท', 'Carrot', 'Carrot (แครอท)'),
  randomQuestions('แตงกวา', 'Cucumber', 'Cucumber (แตงกวา)'),
  randomQuestions('พริกไทย', 'Pepper', 'Pepper (พริกไทย)'),
  randomQuestions('ฟักทอง', 'Pumpkin', 'Pumpkin (ฟักทอง)'),
  randomQuestions('กะหล่ำปลี', 'Cabbage', 'Cabbage (กะหล่ำปลี)'),
  randomQuestions('เห็ด', 'Mushroom', 'Mushroom (เห็ด)'),
  randomQuestions('ข้าวโพด', 'Corn', 'Corn (ข้าวโพด)'),
  randomQuestions('มันฝรั่ง', 'Potato', 'Potato (มันฝรั่ง)'),
  randomQuestions('มะเขือเทศ', 'Tomato', 'Tomato (มะเขือเทศ)'),
];

List<Quiz> verb = [
  randomQuestions('หลับ', 'Sleep', 'Sleep (หลับ)'),
  randomQuestions('ขว้าง', 'Throw', 'Throw (ขว้าง)'),
  randomQuestions('หัวเราะ', 'Laugh', 'Laugh (หัวเราะ)'),
  randomQuestions('ซื้อ', 'Buy', 'Buy (ซื้อ)'),
  randomQuestions('ยืม', 'Borrow', 'Borrow (ยืม)'),
  randomQuestions('ตื่น', 'Wake up', 'Wake up (ตื่น)'),
  randomQuestions('สอน', 'Teach', 'Teach (สอน)'),
  randomQuestions('ยิ้ม', 'Smile', 'Smile (ยิ้ม)'),
  randomQuestions('ขาย', 'Sell', 'Sell (ขาย)'),
  randomQuestions('ดัน', 'Push', 'Push (ดัน)'),
];
