import 'package:flutter/material.dart';
import '../tokens/colors.dart';
import '../tokens/icon_sizes.dart';
import '../tokens/radii.dart';

/// Container size variants for IconContainer
enum IconContainerSize {
  small(RelateyIconSizes.containerSm, RelateyIconSizes.xs),
  medium(RelateyIconSizes.containerMd, RelateyIconSizes.sm),
  large(RelateyIconSizes.containerLg, RelateyIconSizes.md),
  extraLarge(RelateyIconSizes.containerXl, RelateyIconSizes.lg);

  const IconContainerSize(this.containerSize, this.iconSize);
  final double containerSize;
  final double iconSize;
}

/// A circular or rounded icon container with customizable background
class IconContainer extends StatelessWidget {
  const IconContainer({
    super.key,
    required this.icon,
    this.size = IconContainerSize.medium,
    this.backgroundColor,
    this.iconColor,
    this.isCircular = true,
    this.borderRadius,
  });

  final IconData icon;
  final IconContainerSize size;
  final Color? backgroundColor;
  final Color? iconColor;
  final bool isCircular;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.containerSize,
      height: size.containerSize,
      decoration: BoxDecoration(
        color: backgroundColor ?? RelateyColors.primarySubtle,
        borderRadius: isCircular
            ? RelateyRadii.borderRadiusFull
            : BorderRadius.circular(borderRadius ?? RelateyRadii.md),
      ),
      child: Center(
        child: Icon(
          icon,
          size: size.iconSize,
          color: iconColor ?? RelateyColors.primary,
        ),
      ),
    );
  }
}
