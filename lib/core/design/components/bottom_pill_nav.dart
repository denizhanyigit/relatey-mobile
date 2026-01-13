import 'dart:ui';
import 'package:flutter/material.dart';
import '../tokens/colors.dart';
import '../tokens/icon_sizes.dart';
import '../tokens/radii.dart';
import '../tokens/shadows.dart';
import '../tokens/spacing.dart';
import '../tokens/typography.dart';

/// Navigation item data for BottomPillNav
class NavItem {
  const NavItem({
    required this.icon,
    required this.label,
    this.activeIcon,
  });

  final IconData icon;
  final IconData? activeIcon;
  final String label;
}

/// A floating pill-shaped bottom navigation bar with blur effect
class BottomPillNav extends StatelessWidget {
  const BottomPillNav({
    super.key,
    required this.items,
    required this.currentIndex,
    this.onTap,
  });

  final List<NavItem> items;
  final int currentIndex;
  final ValueChanged<int>? onTap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: RelateySpacing.screenHorizontal,
            vertical: RelateySpacing.screenHorizontal,
          ),
          child: Center(
            child: ClipRRect(
              borderRadius: RelateyRadii.borderRadiusFull,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: RelateySpacing.screenHorizontal,
                    vertical: RelateySpacing.md,
                  ),
                  decoration: BoxDecoration(
                    color: RelateyColors.glassWhite,
                    borderRadius: RelateyRadii.borderRadiusFull,
                    border: Border.all(
                      color: RelateyColors.glassBorder,
                      width: 1,
                    ),
                    boxShadow: RelateyShadows.navigation,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(items.length, (index) {
                      final item = items[index];
                      final isActive = index == currentIndex;

                      return Padding(
                        padding: EdgeInsets.only(
                          left: index > 0 ? RelateySpacing.xxxl : 0,
                        ),
                        child: _NavItemWidget(
                          item: item,
                          isActive: isActive,
                          onTap: onTap != null ? () => onTap!(index) : null,
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItemWidget extends StatelessWidget {
  const _NavItemWidget({
    required this.item,
    required this.isActive,
    this.onTap,
  });

  final NavItem item;
  final bool isActive;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isActive ? (item.activeIcon ?? item.icon) : item.icon,
            size: RelateyIconSizes.nav,
            color: isActive ? RelateyColors.primary : RelateyColors.textTertiary,
          ),
          const SizedBox(height: RelateySpacing.xs),
          Text(
            item.label,
            style: isActive
                ? RelateyTypography.navLabelActive
                : RelateyTypography.navLabel.copyWith(
                    color: RelateyColors.textTertiary,
                  ),
          ),
        ],
      ),
    );
  }
}
