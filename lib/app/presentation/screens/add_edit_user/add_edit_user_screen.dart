import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userly/app/presentation/screens/add_edit_user/add_edit_user_controller.dart';
import 'package:userly/app/presentation/screens/add_edit_user/widgets/add_edit_user_footer.dart';
import 'package:userly/app/presentation/screens/add_edit_user/widgets/add_edit_user_form.dart';
import 'package:userly/core/theme/app_colors.dart';

class AddEditUserScreen extends StatelessWidget {
  const AddEditUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddEditUserController>(builder: (controller) {
      return Scaffold(
        body: const AddEditUserForm(),
        bottomNavigationBar: Builder(builder: (context) {
          final bottomPadding = MediaQuery.of(context).viewInsets.bottom;
          return Container(
            color: AppColors.kDefaultGradient3,
            padding: EdgeInsets.only(bottom: bottomPadding),
            child: const SafeArea(
              child: AddEditUserFooter(),
            ),
          );
        }),
      );
    });
  }
}
