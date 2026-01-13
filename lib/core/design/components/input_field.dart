import 'package:flutter/material.dart';
import '../tokens/colors.dart';
import '../tokens/radii.dart';
import '../tokens/spacing.dart';
import '../tokens/typography.dart';

class InputField extends StatelessWidget {
  const InputField({super.key, this.controller, this.hintText, this.labelText, this.helperText, this.errorText, this.maxLines = 1, this.minLines, this.maxLength, this.onChanged, this.onSubmitted, this.keyboardType, this.textInputAction, this.autofocus = false, this.readOnly = false, this.obscureText = false, this.enabled = true, this.prefixIcon, this.suffixIcon});
  
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final String? errorText;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool autofocus;
  final bool readOnly;
  final bool obscureText;
  final bool enabled;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
      if (labelText != null) ...[Text(labelText!, style: RelateyTypography.labelLarge), const SizedBox(height: RelateySpacing.sm)],
      TextField(
        controller: controller, onChanged: onChanged, onSubmitted: onSubmitted, keyboardType: keyboardType, textInputAction: textInputAction, autofocus: autofocus, readOnly: readOnly, obscureText: obscureText, enabled: enabled, maxLines: obscureText ? 1 : maxLines, minLines: minLines, maxLength: maxLength, style: RelateyTypography.bodyLarge,
        decoration: InputDecoration(
          hintText: hintText, errorText: errorText, helperText: helperText, filled: true, fillColor: enabled ? RelateyColors.surface : RelateyColors.surfaceVariant,
          contentPadding: const EdgeInsets.symmetric(horizontal: RelateySpacing.lg, vertical: RelateySpacing.lg),
          border: OutlineInputBorder(borderRadius: RelateyRadii.borderRadiusMd, borderSide: const BorderSide(color: RelateyColors.border)),
          enabledBorder: OutlineInputBorder(borderRadius: RelateyRadii.borderRadiusMd, borderSide: const BorderSide(color: RelateyColors.border)),
          focusedBorder: OutlineInputBorder(borderRadius: RelateyRadii.borderRadiusMd, borderSide: const BorderSide(color: RelateyColors.primary, width: 1.5)),
          errorBorder: OutlineInputBorder(borderRadius: RelateyRadii.borderRadiusMd, borderSide: const BorderSide(color: RelateyColors.error)),
          prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: RelateyColors.textSecondary) : null,
          suffixIcon: suffixIcon,
        ),
      ),
    ]);
  }
}
