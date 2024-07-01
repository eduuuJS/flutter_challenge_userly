// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'package:userly/app/data/repository/user_repository.dart';
import 'package:userly/app/domain/user.dart';

class UsersController extends GetxController {
  @override
  void onInit() {
    _initialize();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //Variables

  //States
  RxBool isLoading = true.obs;
  RxList<User> users = RxList<User>([]);

  //Instances
  final _userRepository = Get.find<IUserRepository>();

  //Methods
  _initialize() async {
    isLoading.value = true;
    await getUsers();
    isLoading.value = false;
  }

  Future<void> getUsers() async {
    users.value = await _userRepository.getUsers();
  }

  void addNewUser(User user) async {
    _userRepository.createUser(user);
    //Simulate true response
    if (true) {
      users.value = [user, ...users];
    }
  }

  void updateUser(User user) async {
    _userRepository.updateUser(user.id, user);
    //Simulate true response
    if (true) {
      users.value = [user, ...users.where((e) => e.id != user.id)];
    }
  }

  void deleteUser(User user) async {
    _userRepository.deleteUser(user.id);
    //Simulate true response
    if (true) {
      users.value = [...users.where((e) => e.uuid != user.uuid)];
    }
    users.value = [...users.where((e) => e.uuid != user.uuid)];
  }
}
