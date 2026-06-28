import 'package:discussify/user/data/model.dart';

class UserRepository {
  Future<List<UserModel>> fetchUsers() async {
    try {
      // TODO: Implement Supabase integration
      await Future.delayed(const Duration(milliseconds: 500));
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<UserModel?> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      // TODO: Implement Supabase integration
      await Future.delayed(const Duration(milliseconds: 500));
      
      return UserModel(
        id: 'user_${DateTime.now().millisecondsSinceEpoch}',
        email: email,
        password: password, 
      );
    } catch (e) {
      return null;
    }
  }
}
