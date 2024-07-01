import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userly/app/presentation/screens/detail_user/detail_user_controller.dart';
import 'package:userly/app/presentation/screens/detail_user/widgets/detail_user_content.dart';

class DetailUserScreen extends StatelessWidget {
  const DetailUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailUserController>(builder: (controller) {
      return const Scaffold(
        body: DetailUserContent(),
      );
    });
  }
}
