import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/design/components/bottom_pill_nav.dart';
import '../../../core/design/components/home_lens_tile.dart';
import '../../../core/design/components/section_header_row.dart';
import '../../../core/design/components/situation_tile.dart';
import '../../../core/design/tokens/colors.dart';
import '../../../core/design/tokens/radii.dart';
import '../../../core/design/tokens/spacing.dart';
import '../../../core/design/tokens/typography.dart';

/// Home screen displaying situation tiles and different lenses.
///
/// This is the main entry point for the decisions feature,
/// allowing users to select a relationship situation to clarify.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

                // Situation tiles list
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: RelateySpacing.screenHorizontal,
                  ),
                  sliver: SliverList.separated(
                    itemCount: _situations.length,
                    separatorBuilder: (_, __) =>
                        const SizedBox(height: RelateySpacing.xl),
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

                // Different Lenses section
                SliverToBoxAdapter(
                  child: _buildLensesSection(context),
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

  Widget _buildLensesSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        RelateySpacing.screenHorizontal,
        RelateySpacing.xxxl,
        RelateySpacing.screenHorizontal,
        RelateySpacing.sm,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeaderRow(title: 'Different Lenses'),
          const SizedBox(height: RelateySpacing.lg),
          Row(
            children: [
              Expanded(
                child: HomeLensTile(
                  label: 'Dream\nReflection',
                  icon: Icons.bedtime_outlined,
                  onTap: () => _onLensTap(context, 'dream'),
                ),
              ),
              const SizedBox(width: RelateySpacing.md),
              Expanded(
                child: HomeLensTile(
                  label: 'Stellar\nInsights',
                  icon: Icons.auto_awesome_outlined,
                  onTap: () => _onLensTap(context, 'stellar'),
                ),
              ),
              const SizedBox(width: RelateySpacing.md),
              Expanded(
                child: HomeLensTile(
                  label: 'Intuitive\nPerspective',
                  icon: Icons.visibility_outlined,
                  onTap: () => _onLensTap(context, 'intuitive'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onSituationTap(BuildContext context, _SituationData situation) {
    context.push('/decision/context', extra: situation.key);
  }

  void _onLensTap(BuildContext context, String lensKey) {
    // Lens navigation placeholder
  }

  void _onSettingsTap(BuildContext context) {
    // Settings navigation placeholder
  }

  void _onNavTap(BuildContext context, int index) {
    // Navigation placeholder
    // 0 = Home (current), 1 = History, 2 = Guides, 3 = Profile
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
