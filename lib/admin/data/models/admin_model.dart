class AdminModel {
  final String id;
  final String email;
  final String password;
  final String fullName;
  final DateTime createdAt;

  AdminModel({
    required this.id,
    required this.email,
    required this.password,
    required this.fullName,
    required this.createdAt,
  });

  factory AdminModel.fromJson(Map<String, dynamic> json) {
    return AdminModel(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      fullName: json['full_name'] ?? '',
      createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'full_name': fullName,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
