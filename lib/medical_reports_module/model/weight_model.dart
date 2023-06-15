import 'package:cloud_firestore/cloud_firestore.dart';

class WeightModel {
  final double weight;
  final double? height;
  final String? id;
  final DateTime date;

  WeightModel({
    required this.weight,
    required this.height,
    required this.date,
    this.id,
  });

  factory WeightModel.fromJson(Map<String, dynamic> json) {
    return WeightModel(
      id: json['id'],
      height: json['height'] as double,
      weight: json['weight'] as double,
      date: (json['date'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'height': height,
      'weight': weight,
      'date': date,
    };
  }
}
