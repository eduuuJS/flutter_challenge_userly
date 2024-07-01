import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userly/app/presentation/screens/users/users_controller.dart';
import 'package:userly/app/presentation/screens/users/widgets/add_user_btn.dart';
import 'package:userly/app/presentation/screens/users/widgets/users_list.dart';

class UsersScreen extends GetView<UsersController> {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsersController>(builder: (controller) {
      return Scaffold(
        body: Obx(() => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : const UsersList()),
        floatingActionButton: Obx(
          () => controller.isLoading.value
              ? const SizedBox.shrink()
              : const AddUserBtn(),
        ),
      );
    });
  }
}
