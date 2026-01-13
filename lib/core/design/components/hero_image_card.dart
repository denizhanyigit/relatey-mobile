import 'package:flutter/material.dart';
import '../tokens/colors.dart';
import '../tokens/radii.dart';
import '../tokens/shadows.dart';

/// A large visual container for hero images on onboarding/welcome screens.
///
/// Displays an image with a 3:4 aspect ratio, rounded corners, and a
/// soft primary-tinted shadow. Supports network images, asset images,
/// or custom child widgets.
class HeroImageCard extends StatelessWidget {
  const HeroImageCard({
    super.key,
    this.imageUrl,
    this.assetPath,
    this.child,
    this.maxHeightFraction = 0.45,
    this.borderRadius = RelateyRadii.xxl,
  }) : assert(
         imageUrl != null || assetPath != null || child != null,
         'Must provide imageUrl, assetPath, or child',
       );

  /// URL for network image
  final String? imageUrl;

  /// Path to asset image
  final String? assetPath;

  /// Custom child widget (overrides imageUrl and assetPath)
  final Widget? child;

  /// Maximum height as a fraction of viewport height (default: 0.45 = 45vh)
  final double maxHeightFraction;

  /// Corner radius (default: xxl = 24)
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final maxHeight = screenHeight * maxHeightFraction;

    return Container(
      constraints: BoxConstraints(maxHeight: maxHeight),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: RelateyShadows.heroCard,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: AspectRatio(
          aspectRatio: 3 / 4,
          child: _buildContent(),
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (child != null) return child!;

    if (assetPath != null) {
      return Image.asset(
        assetPath!,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => _buildPlaceholder(),
      );
    }

    if (imageUrl != null) {
      return Image.network(
        imageUrl!,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return _buildPlaceholder(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
              strokeWidth: 2,
              color: RelateyColors.primary,
            ),
          );
        },
        errorBuilder: (_, __, ___) => _buildPlaceholder(),
      );
    }

    return _buildPlaceholder();
  }

  Widget _buildPlaceholder({Widget? child}) {
    return Container(
      color: RelateyColors.surfaceVariant,
      child: Center(
        child: child ??
            const Icon(
              Icons.image_outlined,
              size: 48,
              color: RelateyColors.textTertiary,
            ),
      ),
    );
  }
}
