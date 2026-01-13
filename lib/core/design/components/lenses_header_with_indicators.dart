import 'package:flutter/material.dart';
import '../tokens/colors.dart';
import '../tokens/spacing.dart';
import '../tokens/typography.dart';

/// Minimal header and icon-only indicator row for "Different Lenses".
///
/// Provides progressive discovery: starts with header + icon indicators,
/// expands naturally into full cards as user scrolls. Single section pattern.
class LensesHeaderWithIndicators extends StatelessWidget {
  const LensesHeaderWithIndicators({
    super.key,
    required this.onSeeAllTap,
  });

  final VoidCallback onSeeAllTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header row: "Different Lenses" + "See all"
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Different Lenses',
              style: RelateyTypography.titleMedium,
            ),
            GestureDetector(
              onTap: onSeeAllTap,
              behavior: HitTestBehavior.opaque,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'See all',
                    style: RelateyTypography.labelLarge.copyWith(
                      color: RelateyColors.textSecondary,
                    ),
                  ),
                  const SizedBox(width: RelateySpacing.xs),
                  const Icon(
                    Icons.chevron_right,
                    color: RelateyColors.textSecondary,
                    size: 18,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: RelateySpacing.lg),
        // Icon-only indicator row (suggest content continues below)
        Row(
          children: [
            _IconIndicator(icon: Icons.bedtime_outlined),
            const SizedBox(width: RelateySpacing.lg),
            _IconIndicator(icon: Icons.auto_awesome_outlined),
            const SizedBox(width: RelateySpacing.lg),
            _IconIndicator(icon: Icons.visibility_outlined),
          ],
        ),
      ],
    );
  }
}

/// Small, muted icon indicator
class _IconIndicator extends StatelessWidget {
  const _IconIndicator({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        color: RelateyColors.surfaceVariant,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Icon(
          icon,
          color: RelateyColors.textTertiary,
          size: 18,
        ),
      ),
    );
  }
}
