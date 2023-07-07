class PrescriptionModel {
  final int? id;
  final String? userId;
  final String name;
  final String dose;
  final DateTime time;

  PrescriptionModel({
    this.id,
    required this.userId,
    required this.name,
    required this.dose,
    required this.time,
  });

  PrescriptionModel copyWith({
    int? id,
    String? userId,
    String? name,
    String? dose,
    DateTime? time,
  }) {
    return PrescriptionModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      dose: dose ?? this.dose,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'dose': dose,
      'time': time.toIso8601String(),
    };
  }

  factory PrescriptionModel.fromJson(Map<String, dynamic> json) {
    return PrescriptionModel(
      id: json['id'],
      userId: json['userId'],
      name: json['name'],
      dose: json['dose'],
      time: DateTime.parse(json['time']),
    );
  }
}