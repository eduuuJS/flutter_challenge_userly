// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'package:userly/app/domain/user.dart';

class DetailUserController extends GetxController {
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
  late User user;

  //States

  //Instances

  //Methods
  _initialize() async {
    user = Get.arguments['user'] as User;
  }
}
