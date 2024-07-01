import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userly/app/presentation/components/primary_button.dart';
import 'package:userly/app/presentation/screens/add_edit_user/add_edit_user_controller.dart';

class AddEditUserFooter extends StatelessWidget {
  const AddEditUserFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddEditUserController>(builder: (controller) {
      Widget btnBack() => PrimaryButton(
            small: true,
            label: "Cancelar",
            isSecondaryButton: true,
            onTap: () {
              Get.back();
            },
          );

      Widget btnSave() => PrimaryButton(
            small: true,
            label: "Guardar",
            onTap: () {
              if (controller.formKey.currentState!.validate()) {
                controller.saveUser();
              }
            },
          );

      return Container(
        margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        height: 40.0,
        child: Row(
          children: [
            Expanded(child: btnBack()),
            const SizedBox(width: 10.0),
            Expanded(child: btnSave()),
          ],
        ),
      );
    });
  }

  // void _register(BuildContext context, WidgetRef ref) async {
  //   ref.read(spinnerStateProvider.notifier).show();
  //   final response =
  //       await ref.read(onboardingAccountControllerProvider).createAccount();
  //   ref.read(spinnerStateProvider.notifier).hide();
  //   if (response.success) {
  //     context.go(AppRoutesNamed.onboardingConfigRoute);
  //   } else {
  //     Alerts.getDialog(
  //         context,
  //         ActionDialog(
  //           type: AlertType.error,
  //           title: "Error",
  //           subTitle: response.message,
  //         ));
  //   }
  // }
}
