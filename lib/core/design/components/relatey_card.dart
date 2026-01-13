import 'package:flutter/material.dart';
import '../tokens/colors.dart';
import '../tokens/radii.dart';
import '../tokens/shadows.dart';
import '../tokens/spacing.dart';

class RelateyCard extends StatelessWidget {
  const RelateyCard({super.key, required this.child, this.padding, this.onTap, this.backgroundColor, this.borderColor, this.showShadow = true});
  
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? borderColor;
  final bool showShadow;
  
  @override
  Widget build(BuildContext context) {
    final content = Container(
      padding: padding ?? const EdgeInsets.all(RelateySpacing.cardPadding),
      decoration: BoxDecoration(
        color: backgroundColor ?? RelateyColors.surface,
        borderRadius: RelateyRadii.borderRadiusLg,
        border: borderColor != null ? Border.all(color: borderColor!) : Border.all(color: RelateyColors.border.withValues(alpha: 0.5)),
        boxShadow: showShadow ? RelateyShadows.card : null,
      ),
      child: child,
    );
    
    if (onTap != null) return GestureDetector(onTap: onTap, child: content);
    return content;
  }
}
