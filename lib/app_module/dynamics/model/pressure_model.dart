import 'package:cloud_firestore/cloud_firestore.dart';

class PressureModel {
  final int sys;
  final int dia;
  final String? id;
  final int? pulse;
  final DateTime date;
  PressureModel({required this.sys, required this.dia,this.id, this.pulse,required this.date});

  factory PressureModel.fromJson(Map<String, dynamic> json) {
    return PressureModel(
      sys: json['sys'],
      dia: json['dia'],
      id: json['id'],
      pulse: json['pulse'],
      date: (json['date'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'sys': sys,
      'dia': dia,
      'pulse': pulse,
      'date':date
    };
  }
}