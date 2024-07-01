// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userly/app/domain/action_type.dart';
import 'package:userly/app/domain/user.dart';
import 'package:userly/app/presentation/screens/users/users_controller.dart';
import 'package:userly/core/utils/helpers.dart';

class AddEditUserController extends GetxController {
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
  final formKey = GlobalKey<FormState>();
  late ActionType actionType;
  late User? user;

  //Instances
  final usersController = Get.find<UsersController>();

  //TextEditingControllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final phoneController = TextEditingController();
  final websiteController = TextEditingController();

  //Methods
  _initialize() async {
    final arguments = Get.arguments as Map<String, dynamic>;
    actionType = arguments['actionType'] as ActionType;
    user = arguments['user'] as User?;
    if (actionType == ActionType.update) {
      nameController.text = user!.name;
      emailController.text = user!.email;
      usernameController.text = user!.username;
      phoneController.text = user!.phone;
      websiteController.text = user!.website;
    }
  }

  void saveUser() async {
    if (actionType == ActionType.create) {
      createUser();
    } else {
      updateUser();
    }
  }

  void createUser() async {
    final newUser = User(
      uuid: Helpers.generateId(),
      name: nameController.text,
      username: usernameController.text,
      id: 0,
      email: emailController.text,
      phone: phoneController.text,
      website: websiteController.text,
    );
    usersController.addNewUser(newUser);
    Get.back();
  }

  void updateUser() async {
    final updatedUser = User(
      uuid: user!.uuid,
      name: nameController.text,
      username: usernameController.text,
      id: user!.id,
      email: emailController.text,
      phone: phoneController.text,
      website: websiteController.text,
    );
    usersController.updateUser(updatedUser);
    Get.back();
  }
}
