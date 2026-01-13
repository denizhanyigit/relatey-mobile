import 'package:flutter/material.dart';
import '../tokens/colors.dart';
import '../tokens/spacing.dart';

/// A consistent screen wrapper that provides SafeArea and standard padding.
///
/// Use this component to wrap all screen content for consistent margins
/// and safe area handling across the app.
class ScreenContainer extends StatelessWidget {
  const ScreenContainer({
    super.key,
    required this.child,
    this.horizontalPadding = RelateySpacing.screenHorizontal,
    this.topPadding,
    this.bottomPadding,
    this.backgroundColor,
    this.useSafeArea = true,
  });

  final Widget child;
  final double horizontalPadding;
  final double? topPadding;
  final double? bottomPadding;
  final Color? backgroundColor;
  final bool useSafeArea;

  @override
  Widget build(BuildContext context) {
    Widget content = Padding(
      padding: EdgeInsets.only(
        left: horizontalPadding,
        right: horizontalPadding,
        top: topPadding ?? 0,
        bottom: bottomPadding ?? 0,
      ),
      child: child,
    );

    if (useSafeArea) {
      content = SafeArea(child: content);
    }

    return ColoredBox(
      color: backgroundColor ?? RelateyColors.background,
      child: content,
    );
  }
}
