import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:userly/core/routes/app_routes.dart';
import 'package:userly/core/routes/app_views.dart';
import 'package:userly/core/config/app_config.dart';
import 'package:userly/core/network/dio_config.dart';
import 'package:userly/core/theme/app_theme.dart';
import 'package:userly/core/utils/dependency_injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.initialize();
  DioConfig.initialize();
  DependencyInjection.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: ScreenUtil.defaultSize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Userly',
        theme: lightTheme(context),
        initialRoute: AppRoutes.splash,
        getPages: AppViews.views,
      ),
    );
  }
}
