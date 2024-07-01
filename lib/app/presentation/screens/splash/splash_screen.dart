import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userly/core/routes/app_routes.dart';
import 'package:userly/core/theme/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashContentState();
}

class _SplashContentState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController dxLogoController;
  late Animation<double> dxLogoAnimation;
  late Animation<double> spaceAnimation;

  @override
  void initState() {
    super.initState();
    dxLogoController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    dxLogoAnimation = Tween<double>(
      begin: 0,
      end: 121,
    ).animate(
      CurvedAnimation(
        parent: dxLogoController,
        curve: Curves.easeIn,
      ),
    );
    spaceAnimation = Tween<double>(
      begin: 0,
      end: 20,
    ).animate(
      CurvedAnimation(
        parent: dxLogoController,
        curve: Curves.easeIn,
      ),
    );
    dxLogoController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        await Future.delayed(const Duration(milliseconds: 300));
        Get.offAllNamed(AppRoutes.usersList);
      }
    });
  }

  @override
  void dispose() {
    dxLogoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 700), () {
      if (mounted) {
        dxLogoController.forward();
      }
    });
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage('assets/img/logo.png')),
            AnimatedBuilder(
                animation: dxLogoController,
                builder: (context, _) {
                  return SizedBox(
                    width: spaceAnimation.value,
                  );
                }),
            AnimatedBuilder(
                animation: dxLogoController,
                builder: (context, _) {
                  return SizedBox(
                    width: dxLogoAnimation.value,
                    child: RichText(
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      text: const TextSpan(
                          text: "User",
                          style: TextStyle(
                            fontSize: 36.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: "ly",
                              style: TextStyle(
                                fontSize: 36.0,
                                fontWeight: FontWeight.bold,
                                color: AppColors.kPrimary,
                              ),
                            ),
                          ]),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
