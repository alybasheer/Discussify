class CreateUserModel {
  final String id;
  final String email;
  final String fullName;
  final String password;
  final DateTime createdAt;

  CreateUserModel({
    required this.id,
    required this.email,
    required this.fullName,
    required this.password,
    required this.createdAt,
  });

  factory CreateUserModel.fromJson(Map<String, dynamic> json) {
    return CreateUserModel(

      id: json['id'] ?? '',
      email: json['email'] ?? '',
      fullName: json['full_name'] ?? '',
      password: json['password'] ?? '',
      createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'full_name': fullName,
      'password': password,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
