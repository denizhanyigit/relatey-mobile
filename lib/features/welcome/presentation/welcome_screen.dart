import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/design/components/hero_image_card.dart';
import '../../../core/design/components/primary_button.dart';
import '../../../core/design/tokens/colors.dart';
import '../../../core/design/tokens/spacing.dart';
import '../../../core/design/tokens/typography.dart';

/// The welcome/onboarding screen - the first touchpoint for users.
///
/// This screen presents a calm, welcoming introduction to Relatey
/// without any premium messaging or sales pressure. The goal is to
/// feel like starting a conversation with a companion.
class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  // Hero image URL (sand ripples - calm, zen-like)
  static const String _heroImageUrl =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuAXFgA7ygGmgt36qyZ3GdRrzja_hlVHoxYNhnqaVybj_wLgsFTvEnOk36dNDsEHSW65LrJH7LnBzLHBgbzT6zZPuKQCAsUjutmSSLGsmaarJ8fBnNPEkL_UInScwnsVwmyz8I1Mq1OK6uOJUzcrZzqkEzKPjg21BnhxFLlFEcgca_Ah8oC8IixPzwiMGZDVRhLgIPjRhn9QA48XHaSM40U_UpPRzH4DDveooOmAJrL-8neo2IB8ckavuRgD3Uors_h7G1yaXs5NnocU';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: RelateyColors.background,
      body: Stack(
        children: [
          // Background decorative orbs
          const _BackgroundOrbs(),

          // Subtle gradient glow behind hero area
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.sizeOf(context).height * 0.55,
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(0, -0.3),
                  radius: 1.2,
                  colors: [
                    RelateyColors.primary.withValues(alpha: 0.06),
                    RelateyColors.background.withValues(alpha: 0),
                  ],
                ),
              ),
            ),
          ),

          // Main content
          SafeArea(
            bottom: false,
            child: Column(
              children: [
                // Reduced top spacing - hero anchored higher
                const SizedBox(height: RelateySpacing.md),

                // Hero section with badge
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: RelateySpacing.screenHorizontal,
                  ),
                  child: Column(
                    children: [
                      // Hero image card - increased size
                      HeroImageCard(
                        imageUrl: _heroImageUrl,
                        maxHeightFraction: 0.48,
                      ),

                      // Badge positioned close to hero
                      SizedBox(height: RelateySpacing.lg),
                      _CategoryBadge(),
                    ],
                  ),
                ),

                const SizedBox(height: RelateySpacing.xxl),

                // Text content
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: RelateySpacing.screenHorizontal,
                  ),
                  child: _WelcomeContent(),
                ),

                // Flexible spacer pushes CTA to bottom
                const Spacer(),

                // Primary CTA button with more bottom breathing room
                Padding(
                  padding: EdgeInsets.only(
                    left: RelateySpacing.screenHorizontal,
                    right: RelateySpacing.screenHorizontal,
                    bottom: bottomPadding + RelateySpacing.xxxl,
                  ),
                  child: PrimaryButton(
                    label: 'Start a conversation',
                    onPressed: () => _onStartConversation(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onStartConversation(BuildContext context) {
    context.go('/home');
  }
}

/// Category badge that contextualizes the hero image.
class _CategoryBadge extends StatelessWidget {
  const _CategoryBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: RelateySpacing.md,
        vertical: RelateySpacing.xs + 2,
      ),
      decoration: BoxDecoration(
        color: RelateyColors.primarySurface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        'MULTIDIMENSIONAL CLARITY',
        style: RelateyTypography.labelSmall.copyWith(
          color: RelateyColors.primary,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.8,
        ),
      ),
    );
  }
}

/// The text content section with headline and subhead.
class _WelcomeContent extends StatelessWidget {
  const _WelcomeContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Headline
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(text: 'Understand your\nrelationship '),
              TextSpan(
                text: 'better',
                style: RelateyTypography.displayMedium.copyWith(
                  color: RelateyColors.primary,
                ),
              ),
            ],
          ),
          style: RelateyTypography.displayMedium.copyWith(
            color: RelateyColors.textPrimary,
          ),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: RelateySpacing.md),

        // Subhead
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 300),
          child: Text(
            'Talk through your thoughts and find clarity together.',
            style: RelateyTypography.bodyLarge.copyWith(
              color: RelateyColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

/// Decorative background blur orbs for visual warmth.
class _BackgroundOrbs extends StatelessWidget {
  const _BackgroundOrbs();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Stack(
      children: [
        // Top-left warm orb
        Positioned(
          top: -size.height * 0.15,
          left: -size.width * 0.1,
          child: Container(
            width: size.width * 0.7,
            height: size.width * 0.7,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: RelateyColors.orbWarm.withValues(alpha: 0.3),
            ),
          ),
        ),

        // Bottom-right primary orb
        Positioned(
          bottom: -size.height * 0.1,
          right: -size.width * 0.1,
          child: Container(
            width: size.width * 0.8,
            height: size.width * 0.8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: RelateyColors.orbPrimary.withValues(alpha: 0.25),
            ),
          ),
        ),
      ],
    );
  }
}
