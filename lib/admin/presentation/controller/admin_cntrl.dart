import 'package:discussify/admin/data/repos/create_user_repo.dart';
import 'package:discussify/user/data/repo.dart';
import 'package:get/get.dart';
import 'package:discussify/admin/data/repos/admin_repo.dart';

class AdminController extends GetxController {
  final AdminRepository _repository = AdminRepository();
  final CreateUserRepository _userRepository = CreateUserRepository();
  final RxList users = <dynamic>[].obs;

  Rx<bool> isLoading = false.obs;
  Rx<String?> errorMessage = Rx<String?>(null);

  Future<void> createAdmin({
    required String email,
    required String password,
    required String fullName,
  }) async {
    isLoading.value = true;
    errorMessage.value = null;

    try {
      final admin = await _repository.createAdmin(
        email: email,
        password: password,
        fullName: fullName,
      );

      if (admin != null) {
        Get.snackbar('Success', 'Admin created successfully');
        Get.offNamed('/home');
      } else {
        errorMessage.value = 'Failed to create admin';
      }
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> createUser({
    required String email,
    required String fullName,
    required String password,
  }) async {
    try {
      final user = await _userRepository.createUser(
        email: email,
        password: password,
        fullName: fullName,
      );

      if (user != null) {
        users.add(user);
        Get.snackbar('Success', 'User created successfully');
      } else {
        errorMessage.value = 'Failed to create user';
      }
    } catch (e) {
      errorMessage.value = e.toString();
    }
  }
}
