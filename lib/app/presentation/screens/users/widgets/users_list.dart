import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:userly/app/domain/action_type.dart';
import 'package:userly/app/domain/user.dart';
import 'package:userly/app/presentation/components/icon_wrapper.dart';
import 'package:userly/app/presentation/screens/users/users_controller.dart';
import 'package:userly/app/presentation/screens/users/widgets/users_appbar.dart';
import 'package:userly/core/routes/app_routes.dart';
import 'package:userly/core/theme/app_colors.dart';

class UsersList extends StatelessWidget {
  const UsersList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsersController>(builder: (controller) {
      return Column(
        children: [
          const UsersAppbar(),
          Expanded(
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration:
                    const BoxDecoration(gradient: AppColors.primaryGradient),
                child: Obx(
                  () => controller.users.isEmpty
                      ? const Center(
                          child: Text(
                            "No hay usuarios",
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      : ListView.separated(
                          padding: const EdgeInsets.only(bottom: 15),
                          itemCount: controller.users.length + 1,
                          itemBuilder: (context, index) {
                            if (index == controller.users.length) {
                              return const SizedBox(height: 65);
                            }
                            final item = controller.users[index];
                            return _Item(
                              item: item,
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 15);
                          },
                        ),
                )),
          ),
        ],
      );
    });
  }
}

class _Item extends StatelessWidget {
  const _Item({required this.item});
  final User item;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsersController>(builder: (controller) {
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(15.0),
                      ),
                      color: Colors.white,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.userDetail,
                              arguments: {'user': item.clone()});
                        },
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(15.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/img/profile.png'),
                              ),
                              const SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    item.email,
                                    style: const TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(15.0),
                    ),
                    color: Color.fromRGBO(243, 244, 250, 1),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.userDetail,
                            arguments: {'user': item.clone()});
                      },
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Image(
                                  image: AssetImage('assets/img/twitter.png'),
                                  width: 20.0,
                                ),
                                const SizedBox(width: 3),
                                const Image(
                                  image: AssetImage('assets/img/instagram.png'),
                                  width: 20.0,
                                ),
                                const Image(
                                  image: AssetImage('assets/img/facebook.png'),
                                  width: 20.0,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  item.username,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconWrapper(
                                  child: const Icon(
                                    Iconsax.eye,
                                    size: 20.0,
                                  ),
                                  onTap: () {
                                    Get.toNamed(AppRoutes.userDetail,
                                        arguments: {'user': item.clone()});
                                  },
                                ),
                                IconWrapper(
                                  child: const Icon(
                                    Iconsax.edit,
                                    size: 20.0,
                                  ),
                                  onTap: () {
                                    Get.toNamed(AppRoutes.userAddEdit,
                                        arguments: {
                                          'actionType': ActionType.update,
                                          'user': item.clone()
                                        });
                                  },
                                ),
                                IconWrapper(
                                  child: const Icon(
                                    Iconsax.trash,
                                    size: 20.0,
                                  ),
                                  onTap: () {
                                    controller.deleteUser(item);
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}
