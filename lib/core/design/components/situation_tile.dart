import 'package:flutter/material.dart';
import '../tokens/colors.dart';
import '../tokens/radii.dart';
import '../tokens/shadows.dart';
import '../tokens/spacing.dart';
import '../tokens/typography.dart';

class SituationTile extends StatelessWidget {
  const SituationTile({super.key, required this.title, required this.onTap, this.subtitle, this.icon});
  
  final String title;
  final VoidCallback onTap;
  final String? subtitle;
  final IconData? icon;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(RelateySpacing.cardPadding),
        decoration: BoxDecoration(color: RelateyColors.surface, borderRadius: RelateyRadii.borderRadiusLg, border: Border.all(color: RelateyColors.border.withValues(alpha: 0.5)), boxShadow: RelateyShadows.card),
        child: Row(children: [
          if (icon != null) ...[Container(width: 44, height: 44, decoration: BoxDecoration(color: RelateyColors.primarySurface, borderRadius: RelateyRadii.borderRadiusMd), child: Icon(icon, color: RelateyColors.primary, size: 22)), const SizedBox(width: RelateySpacing.md)],
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: RelateyTypography.titleMedium), if (subtitle != null) ...[const SizedBox(height: RelateySpacing.xs), Text(subtitle!, style: RelateyTypography.bodySmall)]])),
          const Icon(Icons.chevron_right_rounded, color: RelateyColors.textTertiary, size: 24),
        ]),
      ),
    );
  }
}
