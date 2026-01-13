import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/design/components/situation_tile.dart';
import '../../../core/design/tokens/colors.dart';
import '../../../core/design/tokens/spacing.dart';
import '../../../core/design/tokens/typography.dart';
import '../data/decisions_models.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(RelateySpacing.screenHorizontal, RelateySpacing.xxxl, RelateySpacing.screenHorizontal, RelateySpacing.xxl),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Relatey', style: RelateyTypography.displaySmall.copyWith(color: RelateyColors.primary, fontWeight: FontWeight.w700)),
                  const SizedBox(height: RelateySpacing.sm),
                  Text('Net kararlar için', style: RelateyTypography.bodyLarge.copyWith(color: RelateyColors.textSecondary)),
                ]),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: RelateySpacing.screenHorizontal),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Bugün aklından ne geçiyor?', style: RelateyTypography.headlineSmall),
                  const SizedBox(height: RelateySpacing.lg),
                ]),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: RelateySpacing.screenHorizontal),
              sliver: SliverList.separated(
                itemCount: SituationType.values.length,
                separatorBuilder: (_, __) => const SizedBox(height: RelateySpacing.md),
                itemBuilder: (context, index) {
                  final situation = SituationType.values[index];
                  return SituationTile(title: situation.displayName, icon: _getIconForSituation(situation), onTap: () => _navigateToContext(context, situation));
                },
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: RelateySpacing.sectionLarge)),
          ],
        ),
      ),
    );
  }
  
  IconData _getIconForSituation(SituationType situation) => switch (situation) {
    SituationType.shouldMessage => Icons.chat_bubble_outline_rounded,
    SituationType.shouldWait => Icons.hourglass_empty_rounded,
    SituationType.actingIndecisive => Icons.help_outline_rounded,
    SituationType.cantTrust => Icons.shield_outlined,
    SituationType.shouldEnd => Icons.exit_to_app_rounded,
  };
  
  void _navigateToContext(BuildContext context, SituationType situation) => context.push('/decision/context', extra: situation.key);
}
