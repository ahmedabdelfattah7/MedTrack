class MedicalHistoryModel {
  final String date;
  final String? id;
  final String doctorName;
  final String diagnosis;
  final String complain;

  MedicalHistoryModel({
    required this.date,
    required this.complain,
    required this.doctorName,
    required this.diagnosis,
    this.id,
  });

  factory MedicalHistoryModel.fromJson(Map<String, dynamic> json) {
    return MedicalHistoryModel(
      complain: json['complain'],
      date: json['date'],
      doctorName: json['doctorName'],
      diagnosis: json['diagnosis'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'complain': complain,
      'date': date,
      'doctorName': doctorName,
      'diagnosis': diagnosis,
    };
  }
}