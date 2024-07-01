import 'package:get/get.dart';
import 'package:userly/app/presentation/screens/add_edit_user/add_edit_user_controller.dart';

class AddEditUserBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddEditUserController());
  }
}
