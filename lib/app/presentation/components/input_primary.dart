import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputPrimary extends StatelessWidget {
  const InputPrimary(
      {super.key,
      required this.label,
      this.onTap,
      this.privateText = false,
      this.suffix,
      this.onChanged,
      this.onEditingComplete,
      this.initialValue,
      this.enabledfield = true,
      this.maxlines = 1,
      this.textEditingController,
      this.textInputType = TextInputType.text,
      this.autofocus = false,
      this.inputFormats,
      this.validator,
      this.hinText,
      this.hintTextColor,
      this.prefixIconColor,
      this.autovalidateMode = AutovalidateMode.onUserInteraction,
      this.filled,
      this.filledColor,
      this.textAlign = TextAlign.start,
      this.iconPrefix,
      this.labelColor,
      this.forceEnabledColors});

  final void Function()? onTap;
  final String label;
  final bool privateText;
  final Widget? suffix;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final String? initialValue;
  final bool? enabledfield;
  final int? maxlines;
  final TextEditingController? textEditingController;
  final TextInputType? textInputType;
  final bool? autofocus;
  final List<TextInputFormatter>? inputFormats;
  final String? Function(String?)? validator;
  final String? hinText;
  final Color? hintTextColor;
  final Color? prefixIconColor;
  final AutovalidateMode? autovalidateMode;
  final bool? filled;
  final Color? filledColor;
  final TextAlign textAlign;
  final IconData? iconPrefix;
  final Color? labelColor;
  final bool? forceEnabledColors;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: labelColor ??
                (forceEnabledColors ?? false
                    ? Colors.black
                    : (enabledfield ?? true ? Colors.black : Colors.grey)),
          ),
        ),
        const SizedBox(height: 8.0),
        TextFormField(
          onTap: onTap,
          autovalidateMode: autovalidateMode,
          validator: validator,
          enableSuggestions: true,
          inputFormatters: inputFormats,
          autofocus: autofocus ?? false,
          keyboardType: textInputType,
          maxLines: maxlines,
          readOnly: !enabledfield!,
          initialValue: textEditingController == null ? initialValue : null,
          controller: initialValue == null ? textEditingController : null,
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
          textAlign: textAlign,
          style: TextStyle(
            color: labelColor ??
                (forceEnabledColors ?? false
                    ? Colors.black
                    : (enabledfield ?? true ? Colors.black : Colors.grey)),
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
          obscureText: privateText,
          decoration: InputDecoration(
            prefixIcon: iconPrefix != null
                ? Icon(
                    iconPrefix,
                    size: 16.0,
                    color: prefixIconColor ?? Colors.grey,
                  )
                : null,
            hintStyle: TextStyle(
              color: hintTextColor ?? Colors.grey,
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
            filled: true,
            fillColor: filledColor ?? Colors.white,
            hintText: hinText,
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 18.0,
              vertical: 18.0,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            suffixIcon: suffix,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                width: 0.0,
                color: Colors.transparent,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 0.0,
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                width: 1.4,
                color: enabledfield ?? true ? Colors.black : Colors.grey,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(width: .6, color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }
}
