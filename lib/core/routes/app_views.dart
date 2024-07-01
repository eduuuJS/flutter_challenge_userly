import 'package:get/get.dart';
import 'package:userly/app/presentation/screens/add_edit_user/add_edit_user_bindings.dart';
import 'package:userly/app/presentation/screens/add_edit_user/add_edit_user_screen.dart';
import 'package:userly/app/presentation/screens/detail_user/detail_user_binding.dart';
import 'package:userly/app/presentation/screens/detail_user/detail_user_screen.dart';
import 'package:userly/app/presentation/screens/users/users_binding.dart';
import 'package:userly/core/routes/app_routes.dart';
import 'package:userly/app/presentation/screens/splash/splash_screen.dart';
import 'package:userly/app/presentation/screens/users/users_screen.dart';

abstract class AppViews {
  static final views = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.usersList,
      page: () => const UsersScreen(),
      binding: UsersBinding(),
    ),
    GetPage(
      name: AppRoutes.userAddEdit,
      page: () => const AddEditUserScreen(),
      binding: AddEditUserBindings(),
    ),
    GetPage(
      name: AppRoutes.userDetail,
      page: () => const DetailUserScreen(),
      binding: DetailUserBinding(),
    ),
  ];
}
