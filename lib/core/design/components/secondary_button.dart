import 'package:flutter/material.dart';
import '../tokens/colors.dart';
import '../tokens/radii.dart';
import '../tokens/spacing.dart';
import '../tokens/typography.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({super.key, required this.label, required this.onPressed, this.isLoading = false, this.isEnabled = true, this.fullWidth = true, this.icon});
  
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isEnabled;
  final bool fullWidth;
  final IconData? icon;
  
  @override
  Widget build(BuildContext context) {
    final enabled = isEnabled && !isLoading && onPressed != null;
    
    return SizedBox(
      width: fullWidth ? double.infinity : null,
      height: 52,
      child: OutlinedButton(
        onPressed: enabled ? onPressed : null,
        style: OutlinedButton.styleFrom(
          elevation: 0,
          foregroundColor: enabled ? RelateyColors.primary : RelateyColors.textTertiary,
          side: BorderSide(color: enabled ? RelateyColors.primary : RelateyColors.border),
          padding: const EdgeInsets.symmetric(horizontal: RelateySpacing.xxl, vertical: RelateySpacing.lg),
          shape: RoundedRectangleBorder(borderRadius: RelateyRadii.borderRadiusMd),
        ),
        child: isLoading
            ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, valueColor: AlwaysStoppedAnimation<Color>(RelateyColors.primary)))
            : Row(mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center, children: [
                if (icon != null) ...[Icon(icon, size: 20), const SizedBox(width: RelateySpacing.sm)],
                Text(label, style: RelateyTypography.buttonLarge.copyWith(color: enabled ? RelateyColors.primary : RelateyColors.textTertiary)),
              ]),
      ),
    );
  }
}
