import 'package:language_hack/model/quiz.dart';
import 'package:language_hack/screens/questions_list/questions_method.dart';

Map<String, bool> option;

List<Quiz> environment = [
  randomQuestions("สูญพันธุ์", "Extinct", "Extinct (สูญพันธุ์)"),
  randomQuestions("ภาวะมลพิษ", "Pollution", "Pollution (ภาวะมลพิษ)"),
  randomQuestions("มหาสมุทร", "Ocean", "Ocean (มหาสมุทร)"),
  randomQuestions("ความสัมพันธ์ระหว่างสิ่งมีชีวิตและสิ่งแวดล้อม", "Ecosystem",
      "Ecosystem (ความสัมพันธ์ระหว่างสิ่งมีชีวิตและสิ่งแวดล้อม)"),
  randomQuestions("ฝนกรด", "Acid rain", "Acid rain (ฝนกรด)"),
];

List<Quiz> ielts = [
  randomQuestions("ปีน", "Climb", "Climb (ปีน)"),
  randomQuestions("มั่นคง", "Stable", "Stable (มั่นคง)"),
  randomQuestions("จุดสูงสุด", "Peak", "Peak (จุดสูงสุด)"),
  randomQuestions("การเพิ่มขึ้น", "Increase", "Increase (การเพิ่มขึ้น)"),
  randomQuestions("การลดลง", "Decrease", "Decrease (การลดลง)"),
  randomQuestions("ตก, น้อยลง", "Drop", "Drop (ตก, น้อยลง)"),
];

List<Quiz> car = [
  randomQuestions("แบตเตอรี่", "Battery", "Battery (แบตเตอรี่)"),
  randomQuestions("เข็มขัดนิรภัย", "Seatbelt", "Seatbelt (เข็มขัดนิรภัย)"),
  randomQuestions("หม้อน้ำรถยนต์", "Radiator", "Radiator (หม้อน้ำรถยนต์)"),
  randomQuestions("ล้อ", "Wheel", "Wheel (ล้อ)"),
  randomQuestions("เบรค", "Brake", "Brake (เบรค)"),
  randomQuestions("ประตู", "Door", "Door (ประตู)"),
];

List<Quiz> toefl = [
  randomQuestions(
      "งาน,การมอบหมาย", "Assignment", "Assignment (งาน,การมอบหมาย)"),
  randomQuestions("การคดโกง", "Cheat", "Cheat (การคดโกง)"),
  randomQuestions("บทความ,เรียงความ", "Essay", "Essay (บทความ,เรียงความ)"),
  randomQuestions("การเข้างาน,การเข้าชั้นเรียน", "Attendance",
      "Attendance (การเข้างาน,การเข้าชั้นเรียน)"),
  randomQuestions("ลงทะเบียน,สมัคร", "Enroll", "Enroll (ลงทะเบียน,สมัคร)"),
  randomQuestions("การสอบ", "Exam", "Exam (การสอบ)"),
];

List<Quiz> workshop = [
  randomQuestions("เลื่อยตัดโลหะ", "Hacksaw", "Hacksaw (เลื่อยตัดโลหะ)"),
  randomQuestions("ไม้", "Wood", "Wood (ไม้)"),
  randomQuestions("พลั่ว", "Shovel", "Shovel (พลั่ว)"),
  randomQuestions("กล่องเครื่องมือ", "Toolbox", "Toolbox (กล่องเครื่องมือ)"),
  randomQuestions("บันได", "Ladder", "Ladder (บันได)"),
  randomQuestions("สว่านมือ", "Hand drill", "Hand drill (สว่านมือ)"),
];
