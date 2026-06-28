import 'package:discussify/admin/data/models/admin_model.dart';

class AdminRepository {
  Future<AdminModel?> createAdmin({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      // TODO: Implement Supabase integration
      await Future.delayed(const Duration(milliseconds: 500));
      
      return AdminModel(
        id: 'admin_${DateTime.now().millisecondsSinceEpoch}',
        email: email,
        password: password,
        fullName: fullName,
        createdAt: DateTime.now(),
      );
    } catch (e) {
      return null;
    }
  }
}
