import 'package:get/get.dart';
import 'package:userly/app/presentation/screens/users/users_controller.dart';

class UsersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UsersController());
  }
}
