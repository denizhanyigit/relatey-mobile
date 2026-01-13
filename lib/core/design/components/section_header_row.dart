import 'package:flutter/material.dart';
import '../tokens/colors.dart';
import '../tokens/spacing.dart';
import '../tokens/typography.dart';

/// A section header with title text and an extending divider line
class SectionHeaderRow extends StatelessWidget {
  const SectionHeaderRow({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: RelateyTypography.titleMedium,
        ),
        const SizedBox(width: RelateySpacing.md),
        Expanded(
          child: Container(
            height: 1,
            decoration: BoxDecoration(
              color: RelateyColors.dividerSubtle,
              borderRadius: BorderRadius.circular(RelateySpacing.xs),
            ),
          ),
        ),
      ],
    );
  }
}
