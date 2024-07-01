import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:userly/app/presentation/components/input_primary.dart';
import 'package:userly/app/presentation/screens/add_edit_user/add_edit_user_controller.dart';
import 'package:userly/app/presentation/screens/add_edit_user/widgets/add_edit_user_appbar.dart';
import 'package:userly/core/theme/app_colors.dart';
import 'package:userly/core/utils/validators.dart';

class AddEditUserForm extends StatelessWidget {
  const AddEditUserForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddEditUserController>(builder: (controller) {
      Widget inputName() => InputPrimary(
            label: "Nombres y apellidos",
            autofocus: true,
            hinText: "Ingrese sus nombres y apellidos",
            textEditingController: controller.nameController,
            iconPrefix: Iconsax.user,
            validator: (value) {
              return Validators.simpleRequired(value ?? "");
            },
          );
      Widget inputMail() => InputPrimary(
            label: "Correo electrónico",
            hinText: "Ingrese su correo electrónico",
            textEditingController: controller.emailController,
            iconPrefix: Iconsax.message,
            validator: (value) {
              return Validators.simpleEmail(value ?? "");
            },
          );

      Widget inputUsername() => InputPrimary(
            label: "Nombre de usuario",
            hinText: "Ingrese su nombre de usuario",
            textEditingController: controller.usernameController,
            iconPrefix: Iconsax.user,
            validator: (value) {
              return Validators.simpleRequired(value ?? "");
            },
          );
      Widget inputPhone() => InputPrimary(
            label: "Teléfono (opcional)",
            hinText: "Ingrese su teléfono",
            textEditingController: controller.phoneController,
            iconPrefix: Iconsax.call,
          );
      Widget inputWebsite() => InputPrimary(
            label: "Sitio web (opcional)",
            hinText: "Ingrese su sitio web",
            textEditingController: controller.websiteController,
            iconPrefix: Iconsax.link,
          );

      return Column(
        children: [
          const AddEditUserAppbar(),
          Expanded(
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration:
                    const BoxDecoration(gradient: AppColors.primaryGradient),
                child: Form(
                  key: controller.formKey,
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: const Color.fromRGBO(255, 255, 255, 0.509),
                    ),
                    child: ListView(
                      padding: const EdgeInsets.only(bottom: 15),
                      children: [
                        inputName(),
                        const SizedBox(height: 20),
                        inputMail(),
                        const SizedBox(height: 20),
                        inputUsername(),
                        const SizedBox(height: 20),
                        inputPhone(),
                        const SizedBox(height: 20),
                        inputWebsite(),
                      ],
                    ),
                  ),
                )),
          ),
        ],
      );
    });
  }
}
