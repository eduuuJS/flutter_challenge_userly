import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userly/app/presentation/components/icon_wrapper.dart';
import 'package:userly/app/presentation/screens/detail_user/detail_user_controller.dart';
import 'package:userly/core/theme/app_colors.dart';

class DetailUserAppbar extends StatelessWidget {
  const DetailUserAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailUserController>(builder: (controller) {
      return Row(
        children: [
          Expanded(
            child: Container(
              color: AppColors.kDefaultGradient,
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 30.0, left: 15, right: 15, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconWrapper(
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 20.0,
                        ),
                        onTap: () {
                          Get.back();
                        },
                      ),
                      const Text(
                        "Detalle de usuario",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const IconWrapper(
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 20.0,
                          color: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
