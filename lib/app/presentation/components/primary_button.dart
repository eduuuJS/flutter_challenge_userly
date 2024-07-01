import 'package:flutter/material.dart';
import 'package:userly/core/theme/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key,
      this.onTap,
      required this.label,
      this.isSecondaryButton = false,
      this.small = false,
      this.definedColor});
  final void Function()? onTap;
  final String label;
  final bool isSecondaryButton;
  final bool small;
  final Color? definedColor;

  @override
  Widget build(BuildContext context) {
    Color choosedColor;
    if (definedColor == null) {
      choosedColor = isSecondaryButton ? Colors.white : AppColors.kPrimary;
    } else {
      choosedColor = definedColor!;
    }
    return Container(
      decoration: BoxDecoration(
        color: choosedColor,
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 0.0,
            spreadRadius: 0,
            color: isSecondaryButton ? Colors.white : AppColors.kPrimary,
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: small ? 10.0 : 15.0,
              horizontal: 15.0,
            ),
            child: Center(
              child: Text(
                label,
                style: TextStyle(
                  color: isSecondaryButton ? AppColors.kPrimary : Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
