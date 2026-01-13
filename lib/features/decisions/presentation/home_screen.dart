import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/design/components/bottom_pill_nav.dart';
import '../../../core/design/components/situation_tile.dart';
import '../../../core/design/tokens/colors.dart';
import '../../../core/design/tokens/radii.dart';
import '../../../core/design/tokens/spacing.dart';
import '../../../core/design/tokens/typography.dart';

/// Home screen displaying situation tiles and different lenses.
///
/// This is the main entry point for the decisions feature,
/// allowing users to select a relationship situation to clarify.
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RelateyColors.background,
      body: Stack(
        children: [
          // Background gradient overlay
          const _HeaderGradient(),

          // Main scrollable content
          SafeArea(
            bottom: false,
            child: CustomScrollView(
              slivers: [
                // Header with logo and settings
                SliverToBoxAdapter(
                  child: _buildHeader(context),
                ),

                // Title block
                const SliverToBoxAdapter(
                  child: _TitleBlock(),
                ),

                // Lenses teaser row
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: RelateySpacing.screenHorizontal,
                    ),
                    child: const _LensTeaserRow(),
                  ),
                ),

                const SliverToBoxAdapter(
                  child: SizedBox(height: RelateySpacing.lg),
                ),

                // Situation tiles list
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: RelateySpacing.screenHorizontal,
                  ),
                  sliver: SliverList.separated(
                    itemCount: _situations.length,
                    separatorBuilder: (_, __) =>
                        const SizedBox(height: RelateySpacing.lg),
                    itemBuilder: (context, index) {
                      final situation = _situations[index];

                      return SituationTile(
                        title: situation.title,
                        subtitle: situation.subtitle,
                        icon: situation.icon,
                        onTap: () => _onSituationTap(context, situation),
                      );
                    },
                  ),
                ),

                // Bottom padding for nav bar
                const SliverToBoxAdapter(
                  child: SizedBox(height: 140),
                ),
              ],
            ),
          ),

          // Bottom navigation
          BottomPillNav(
            currentIndex: 0,
            items: const [
              NavItem(
                icon: Icons.home_outlined,
                activeIcon: Icons.home,
                label: 'Home',
              ),
              NavItem(
                icon: Icons.menu_book_outlined,
                label: 'History',
              ),
              NavItem(
                icon: Icons.explore_outlined,
                label: 'Guides',
              ),
              NavItem(
                icon: Icons.account_circle_outlined,
                label: 'Profile',
              ),
            ],
            onTap: (index) => _onNavTap(context, index),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        RelateySpacing.screenHorizontal,
        RelateySpacing.xl,
        RelateySpacing.screenHorizontal,
        RelateySpacing.lg,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: const BoxDecoration(
                  color: RelateyColors.primarySubtle,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.spa_outlined,
                    color: RelateyColors.primary,
                    size: 22,
                  ),
                ),
              ),
              const SizedBox(width: RelateySpacing.sm),
              const Text(
                'Relatey',
                style: RelateyTypography.brandTitle,
              ),
            ],
          ),

          // Settings button
          GestureDetector(
            onTap: () => _onSettingsTap(context),
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                borderRadius: RelateyRadii.borderRadiusFull,
              ),
              child: const Center(
                child: Icon(
                  Icons.settings_outlined,
                  color: RelateyColors.textPrimary,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onSituationTap(BuildContext context, _SituationData situation) {
    context.push('/decision/context', extra: situation.key);
  }

  void _onSettingsTap(BuildContext context) {
    // Settings navigation placeholder
  }

  void _onNavTap(BuildContext context, int index) {
    // Navigation placeholder
    // 0 = Home (current), 1 = History, 2 = Guides, 3 = Profile
  }
}

/// Lightweight teaser row for lens discovery.
///
/// Placed strategically between decision cards to introduce the concept
/// of looking at a situation from different perspectives.
///
/// Design intent:
/// "You can also look at this another way" — not a premium feature.
///
/// Single-line layout:
/// - Small secondary-colored title
/// - 3 compact pill buttons (Dream, Stellar, Intuitive)
/// - No emphasized branding or credit mentions
class _LensTeaserRow extends StatelessWidget {
  const _LensTeaserRow();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Micro title — secondary text for subtle emphasis
        Text(
          'Try a different lens',
          style: RelateyTypography.labelSmall.copyWith(
            color: RelateyColors.textSecondary,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: RelateySpacing.sm),

        // 3 compact pill buttons in a responsive row
        Row(
          children: [
            _LensPill(
              label: 'Dream',
              icon: Icons.bedtime_outlined,
              onTap: () => _navigateToLens(context, 'dream'),
            ),
            const SizedBox(width: RelateySpacing.sm),
            _LensPill(
              label: 'Stellar',
              icon: Icons.auto_awesome_outlined,
              onTap: () => _navigateToLens(context, 'stellar'),
            ),
            const SizedBox(width: RelateySpacing.sm),
            _LensPill(
              label: 'Intuitive',
              icon: Icons.visibility_outlined,
              onTap: () => _navigateToLens(context, 'intuitive'),
            ),
          ],
        ),
      ],
    );
  }

  void _navigateToLens(BuildContext context, String lensKey) {
    // Lens navigation — lightweight, no paywall or premium language
    // Implementation: context.push('/lens/$lensKey', ...)
  }
}

/// Compact pill-shaped button for lens navigation.
///
/// Design specs:
/// - Height: 40px
/// - Rounded (radiusFull)
/// - Soft surface background
/// - No shadows
/// - Icons (18px) + label inline
/// - Expandable to fill equal space in row
///
/// Intent: Lightweight discovery, not premium emphasis.
class _LensPill extends StatelessWidget {
  const _LensPill({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            color: RelateyColors.surfaceVariant,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: RelateyColors.borderSubtle,
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 18,
                color: RelateyColors.textPrimary,
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: RelateyTypography.labelSmall.copyWith(
                  color: RelateyColors.textPrimary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Background gradient overlay for the header area
class _HeaderGradient extends StatelessWidget {
  const _HeaderGradient();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: IgnorePointer(
        child: Opacity(
          opacity: 0.9,
          child: Container(
            height: 384,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  RelateyColors.headerGradientStart,
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Title block widget
class _TitleBlock extends StatelessWidget {
  const _TitleBlock();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(
        RelateySpacing.screenHorizontal,
        RelateySpacing.lg,
        RelateySpacing.screenHorizontal,
        RelateySpacing.screenHorizontal,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Clarify a relationship\ndecision',
            style: RelateyTypography.displayMedium,
          ),
          SizedBox(height: RelateySpacing.sm),
          Text(
            'Select a situation to get actionable advice.',
            style: RelateyTypography.bodyLarge,
          ),
        ],
      ),
    );
  }
}

/// Data class for situation tiles
class _SituationData {
  const _SituationData({
    required this.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  final String key;
  final String title;
  final String subtitle;
  final IconData icon;
}

/// List of available situations
const _situations = [
  _SituationData(
    key: 'should_message',
    title: 'Should I text?',
    subtitle: 'Find the right timing',
    icon: Icons.mark_chat_unread_outlined,
  ),
  _SituationData(
    key: 'should_wait',
    title: 'Should I wait?',
    subtitle: 'Avoid regret',
    icon: Icons.hourglass_top_outlined,
  ),
  _SituationData(
    key: 'acting_indecisive',
    title: 'Decoding mixed signals',
    subtitle: 'Understand what they mean',
    icon: Icons.psychology_alt_outlined,
  ),
  _SituationData(
    key: 'next_steps',
    title: "I don't know what to do next",
    subtitle: 'Clear actionable steps',
    icon: Icons.explore_outlined,
  ),
  _SituationData(
    key: 'should_end',
    title: 'Should I end this?',
    subtitle: 'Make a confident choice',
    icon: Icons.heart_broken_outlined,
  ),
];
