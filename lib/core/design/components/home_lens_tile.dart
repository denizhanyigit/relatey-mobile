import 'package:flutter/material.dart';
import '../tokens/colors.dart';
import '../tokens/radii.dart';
import '../tokens/shadows.dart';
import '../tokens/spacing.dart';
import '../tokens/typography.dart';

/// A grid-style lens tile for the home screen "Different Lenses" section.
///
/// Features:
/// - Vertical card layout with centered content
/// - Circular icon container at top
/// - Two-line label below
/// - Subtle press feedback with scale animation
class HomeLensTile extends StatefulWidget {
  const HomeLensTile({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  State<HomeLensTile> createState() => _HomeLensTileState();
}

class _HomeLensTileState extends State<HomeLensTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.98).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  void _onTapCancel() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: child,
        );
      },
      child: GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: _onTapCancel,
        onTap: widget.onTap,
        child: Container(
          height: 128,
          padding: const EdgeInsets.all(RelateySpacing.lg),
          decoration: BoxDecoration(
            color: RelateyColors.surface,
            borderRadius: RelateyRadii.borderRadiusXl,
            border: Border.all(
              color: Colors.transparent,
              width: 1,
            ),
            boxShadow: RelateyShadows.soft,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: RelateyColors.primarySubtle,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    widget.icon,
                    color: RelateyColors.primary,
                    size: 22,
                  ),
                ),
              ),
              const SizedBox(height: RelateySpacing.md),
              Text(
                widget.label,
                style: RelateyTypography.labelMedium,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
