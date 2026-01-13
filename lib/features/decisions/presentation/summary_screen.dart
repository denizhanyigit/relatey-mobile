import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/di/providers.dart';
import '../../../core/design/components/primary_button.dart';
import '../../../core/design/components/relatey_card.dart';
import '../../../core/design/components/secondary_button.dart';
import '../../../core/design/tokens/colors.dart';
import '../../../core/design/tokens/spacing.dart';
import '../../../core/design/tokens/typography.dart';
import '../../entitlements/domain/access_policy.dart';

class SummaryScreen extends ConsumerStatefulWidget {
  const SummaryScreen({super.key, required this.decisionId});
  final String decisionId;
  @override
  ConsumerState<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends ConsumerState<SummaryScreen> with RouteAware {
  bool _isLoadingPremium = false;
  bool _pendingRetryAfterPaywall = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadDecision());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Check if returning from paywall with pending retry.
    _checkPendingRetry();
  }

  Future<void> _loadDecision() async {
    final controller = ref.read(decisionViewControllerProvider(widget.decisionId).notifier);
    await controller.load();
  }

  Future<void> _checkPendingRetry() async {
    if (!_pendingRetryAfterPaywall) return;
    _pendingRetryAfterPaywall = false;

    // Refresh entitlements from server to get latest credit balance.
    await ref.read(entitlementsControllerProvider.notifier).refresh();

    // Check if we now have access.
    final entitlementsState = ref.read(entitlementsControllerProvider);
    final accessResult = AccessPolicy.checkAccess(
      action: AccessAction.premiumDetail,
      hasPro: entitlementsState.hasPro,
      credits: entitlementsState.credits,
    );

    if (accessResult is AccessAllowed) {
      await _unlockPremiumDetail();
    }
  }

  @override
  Widget build(BuildContext context) {
    final decisionState = ref.watch(decisionViewControllerProvider(widget.decisionId));
    final entitlementsState = ref.watch(entitlementsControllerProvider);
    final decision = decisionState.decision;

    return Scaffold(
      appBar: AppBar(leading: IconButton(icon: const Icon(Icons.close_rounded), onPressed: () => context.go('/home')), title: const Text('Sonuç')),
      body: SafeArea(
        child: decision == null ? const Center(child: CircularProgressIndicator()) : SingleChildScrollView(
          padding: const EdgeInsets.all(RelateySpacing.screenHorizontal),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _buildHeader(),
            const SizedBox(height: RelateySpacing.xxl),
            _buildSummaryCard(decision.summaryText),
            if (decision.hasDetailedText) ...[const SizedBox(height: RelateySpacing.xxl), _buildDetailedCard(decision.detailedText!)],
            const SizedBox(height: RelateySpacing.xxxl),
            if (!decision.hasDetailedText) ...[_buildPremiumCta(entitlementsState)],
            const SizedBox(height: RelateySpacing.lg),
            SecondaryButton(label: 'Yeni durum', onPressed: () => context.go('/home')),
            const SizedBox(height: RelateySpacing.xxl),
          ]),
        ),
      ),
    );
  }

  Widget _buildHeader() => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Container(width: 48, height: 48, decoration: BoxDecoration(color: RelateyColors.primarySurface, borderRadius: BorderRadius.circular(12)), child: const Icon(Icons.check_circle_outline_rounded, color: RelateyColors.primary, size: 28)),
    const SizedBox(height: RelateySpacing.lg),
    Text('Durum netleşiyor', style: RelateyTypography.headlineLarge),
    const SizedBox(height: RelateySpacing.sm),
    Text('Durumunu değerlendirdik', style: RelateyTypography.bodyMedium.copyWith(color: RelateyColors.textSecondary)),
  ]);

  Widget _buildSummaryCard(String summary) => RelateyCard(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Row(children: [
      Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: RelateyColors.primarySurface, borderRadius: BorderRadius.circular(8)), child: const Icon(Icons.lightbulb_outline_rounded, color: RelateyColors.primary, size: 18)),
      const SizedBox(width: RelateySpacing.md),
      Text('Özet', style: RelateyTypography.titleMedium),
    ]),
    const SizedBox(height: RelateySpacing.lg),
    Text(summary, style: RelateyTypography.bodyLarge.copyWith(height: 1.7)),
  ]));

  Widget _buildDetailedCard(String detailed) => RelateyCard(backgroundColor: RelateyColors.primarySurface, borderColor: RelateyColors.primary.withValues(alpha: 0.3), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Row(children: [
      Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: RelateyColors.primary, borderRadius: BorderRadius.circular(8)), child: const Icon(Icons.star_rounded, color: Colors.white, size: 18)),
      const SizedBox(width: RelateySpacing.md),
      Text('Detaylı Yorum', style: RelateyTypography.titleMedium.copyWith(color: RelateyColors.primary)),
    ]),
    const SizedBox(height: RelateySpacing.lg),
    Text(detailed, style: RelateyTypography.bodyLarge.copyWith(height: 1.7)),
  ]));

  Widget _buildPremiumCta(dynamic entitlementsState) {
    final hasPro = entitlementsState.hasPro;
    final credits = entitlementsState.credits;
    return PrimaryButton(label: 'Detaylı yorumu gör', isLoading: _isLoadingPremium, onPressed: () => _onPremiumTap(hasPro, credits));
  }

  Future<void> _onPremiumTap(bool hasPro, int credits) async {
    final accessResult = AccessPolicy.checkAccess(
      action: AccessAction.premiumDetail,
      hasPro: hasPro,
      credits: credits,
    );
    switch (accessResult) {
      case AccessAllowed(): await _unlockPremiumDetail();
      case AccessDenied(): _navigateToPaywall();
    }
  }

  Future<void> _unlockPremiumDetail() async {
    setState(() => _isLoadingPremium = true);
    try {
      final controller = ref.read(decisionViewControllerProvider(widget.decisionId).notifier);
      final success = await controller.unlockPremiumDetail();
      if (success) {
        // Credit deduction happens on server side.
        // Refresh entitlements to sync local cache with server truth.
        await ref.read(entitlementsControllerProvider.notifier).refresh();
      }
    } finally {
      if (mounted) setState(() => _isLoadingPremium = false);
    }
  }

  void _navigateToPaywall() {
    // Mark that we should retry unlock when returning from paywall.
    _pendingRetryAfterPaywall = true;
    context.push('/paywall?reason=PAYWALL_REQUIRED&decisionId=${widget.decisionId}&action=premium_detail');
  }
}
