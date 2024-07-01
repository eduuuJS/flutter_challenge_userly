import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userly/app/domain/action_type.dart';
import 'package:userly/app/presentation/components/primary_button.dart';
import 'package:userly/core/routes/app_routes.dart';

class AddUserBtn extends StatelessWidget {
  const AddUserBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 150,
      child: PrimaryButton(
        label: "+ Nuevo Usuario",
        onTap: () {
          Get.toNamed(AppRoutes.userAddEdit, arguments: {
            'actionType': ActionType.create,
          });
        },
      ),
    );
  }
}
