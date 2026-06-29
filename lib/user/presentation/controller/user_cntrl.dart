import 'package:get/get.dart';
import 'package:discussify/user/data/model.dart';
import 'package:discussify/user/data/repo.dart';

class UserController extends GetxController {
  final UserRepository _repository = UserRepository();

  RxList<UserModel> users = RxList<UserModel>();
  Rx<bool> isLoading = false.obs;
  Rx<String?> errorMessage = Rx<String?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    isLoading.value = true;
    errorMessage.value = null;

    try {
      final fetchedUsers = await _repository.fetchUsers();
      users.assignAll(fetchedUsers);
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }


  }

