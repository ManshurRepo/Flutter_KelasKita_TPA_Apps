// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'test_type.dart';

class QuizModel {
  final String image;
  final String name;
  final String type;
  final String description;
  final int duration;
  final String kategori;

  QuizModel({
    required this.image,
    required this.name,
    required this.type,
    required this.description,
    required this.duration,
    required this.kategori,
  });

  TestType get testType => TestType.fromValue(type);
}
