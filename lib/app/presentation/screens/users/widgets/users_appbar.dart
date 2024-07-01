import 'package:flutter/material.dart';
import 'package:userly/core/theme/app_colors.dart';

class UsersAppbar extends StatelessWidget {
  const UsersAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: AppColors.kDefaultGradient,
            child: const SafeArea(
              bottom: false,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20.0, top: 15.0),
                  child: Text(
                    "Usuarios",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
