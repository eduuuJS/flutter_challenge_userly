import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:userly/app/presentation/screens/detail_user/detail_user_controller.dart';
import 'package:userly/app/presentation/screens/detail_user/widgets/detail_user_appbar.dart';
import 'package:userly/core/theme/app_colors.dart';

class DetailUserContent extends StatelessWidget {
  const DetailUserContent({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailUserController>(builder: (controller) {
      return Column(
        children: [
          const DetailUserAppbar(),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration:
                  const BoxDecoration(gradient: AppColors.primaryGradient),
              child: ListView(
                children: [
                  Row(
                    children: [
                      const Expanded(child: SizedBox()),
                      Column(
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(60)),
                              image: DecorationImage(
                                image: AssetImage('assets/img/profile.png'),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            controller.user.name,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: AppColors.kPrimary,
                            ),
                          ),
                        ],
                      ),
                      const Expanded(child: SizedBox()),
                    ],
                  ),
                  const SizedBox(height: 35),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: const Color.fromRGBO(255, 255, 255, 0.509),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          _itemLabel(
                            "Nombres y apellidos",
                            controller.user.name,
                            Iconsax.user,
                          ),
                          const SizedBox(height: 20),
                          _itemLabel(
                            "Correo electrónico",
                            controller.user.email,
                            Iconsax.message,
                          ),
                          const SizedBox(height: 20),
                          _itemLabel(
                            "Nombre de usuario",
                            controller.user.username,
                            Iconsax.user,
                          ),
                          const SizedBox(height: 20),
                          _itemLabel(
                            "Teléfono",
                            controller.user.phone,
                            Iconsax.call,
                          ),
                          const SizedBox(height: 20),
                          _itemLabel(
                            "Sitio web",
                            controller.user.website,
                            Iconsax.link,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget _itemLabel(String label, String value, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, size: 20),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(width: 10),
        Expanded(
          child: AutoSizeText(
            value,
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: AppColors.kPrimary),
            maxLines: 1,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
