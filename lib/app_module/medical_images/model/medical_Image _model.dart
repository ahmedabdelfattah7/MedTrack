import 'package:cloud_firestore/cloud_firestore.dart';

class MedicalImagesModel {
   String id;
  final String userId;
  final String imageUrl;
  final DateTime createdAt;

  MedicalImagesModel({
    required this.id,
    required this.userId,
    required this.imageUrl,
    required this.createdAt,
  });

  factory MedicalImagesModel.fromDocument(DocumentSnapshot document) {
    final data = document.data() as Map<String, dynamic>;
    return MedicalImagesModel(
      id: document.id,
      userId: data['user_id'] as String,
      imageUrl: data['image_url'] as String,
      createdAt: (data['created_at'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toDocument() {
    return <String, dynamic>{
      'user_id': userId,
      'image_url': imageUrl,
      'created_at': createdAt,
    };
  }
}