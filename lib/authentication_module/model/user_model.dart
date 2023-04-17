class UserModel {
  final String name;
  final String email;
  final String uid;

  UserModel({required this.name, required this.email, required this.uid});

  factory UserModel.fromJson(Map<String, dynamic>? json) {
    return UserModel(
      name: json!['name'],
      email: json['email'],
      uid: json['uid'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'uid': uid,
    };
  }
}