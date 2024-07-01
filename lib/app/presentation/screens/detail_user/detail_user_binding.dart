import 'package:get/get.dart';
import 'package:userly/app/presentation/screens/detail_user/detail_user_controller.dart';

class DetailUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailUserController());
  }
}
