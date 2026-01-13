import 'package:flutter/material.dart';
import '../tokens/colors.dart';
import '../tokens/radii.dart';
import '../tokens/spacing.dart';
import '../tokens/typography.dart';

class LensTile extends StatelessWidget {
  const LensTile({super.key, required this.title, required this.onTap, this.description, this.iconData, this.isLocked = false, this.isSelected = false});
  
  final String title;
  final VoidCallback onTap;
  final String? description;
  final IconData? iconData;
  final bool isLocked;
  final bool isSelected;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(RelateySpacing.md),
        decoration: BoxDecoration(color: isSelected ? RelateyColors.primarySurface : RelateyColors.surface, borderRadius: RelateyRadii.borderRadiusMd, border: Border.all(color: isSelected ? RelateyColors.primary : RelateyColors.border, width: isSelected ? 1.5 : 1)),
        child: Row(children: [
          if (iconData != null) ...[Icon(iconData, color: isLocked ? RelateyColors.textTertiary : RelateyColors.primary, size: 20), const SizedBox(width: RelateySpacing.sm)],
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [Text(title, style: RelateyTypography.titleSmall.copyWith(color: isLocked ? RelateyColors.textTertiary : RelateyColors.textPrimary)), if (description != null) ...[const SizedBox(height: 2), Text(description!, style: RelateyTypography.bodySmall.copyWith(color: RelateyColors.textTertiary), maxLines: 1, overflow: TextOverflow.ellipsis)]])),
          if (isLocked) const Icon(Icons.lock_outline_rounded, color: RelateyColors.textTertiary, size: 18) else if (isSelected) const Icon(Icons.check_circle_rounded, color: RelateyColors.primary, size: 20),
        ]),
      ),
    );
  }
}
