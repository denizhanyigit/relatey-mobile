import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../app/router.dart';
import '../../../core/design/components/primary_button.dart';
import '../../../core/design/components/relatey_card.dart';
import '../../../core/design/components/secondary_button.dart';
import '../../../core/design/tokens/colors.dart';
import '../../../core/design/tokens/radii.dart';
import '../../../core/design/tokens/spacing.dart';
import '../../../core/design/tokens/typography.dart';

class CreditPack { const CreditPack({required this.credits, required this.price, this.isDefault = false, this.isPro = false}); final int credits; final String price; final bool isDefault; final bool isPro; }

class PaywallScreen extends ConsumerStatefulWidget {
  const PaywallScreen({super.key, this.reason, this.decisionId, this.action});
  final String? reason; final String? decisionId; final String? action;
  @override
  ConsumerState<PaywallScreen> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends ConsumerState<PaywallScreen> {
  int _selectedPackIndex = 0;
  static const List<CreditPack> _packs = [CreditPack(credits: 3, price: '₺79,90', isDefault: true), CreditPack(credits: 1, price: '₺29,90'), CreditPack(credits: 7, price: '₺149,90')];
  static const CreditPack _proPack = CreditPack(credits: 0, price: '₺149,90/ay', isPro: true);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(icon: const Icon(Icons.close_rounded), onPressed: () => context.pop()), backgroundColor: Colors.transparent, elevation: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: RelateySpacing.screenHorizontal),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _buildHeader(), const SizedBox(height: RelateySpacing.xxxl),
            _buildBenefits(), const SizedBox(height: RelateySpacing.xxxl),
            _buildCreditPacks(), const SizedBox(height: RelateySpacing.lg),
            _buildProOption(), const SizedBox(height: RelateySpacing.xxxl),
            _buildPurchaseButton(),
            if (kDebugMode) ...[const SizedBox(height: RelateySpacing.lg), _buildDevSimulateButton()],
            const SizedBox(height: RelateySpacing.xxl),
          ]),
        ),
      ),
    );
  }
  
  Widget _buildHeader() => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Text('Daha net görmek\nister misin?', style: RelateyTypography.displayMedium),
    const SizedBox(height: RelateySpacing.md),
    Text('Detaylı analizle durumun tam olarak netleşsin.', style: RelateyTypography.bodyLarge.copyWith(color: RelateyColors.textSecondary)),
  ]);
  
  Widget _buildBenefits() {
    final benefits = [('Net aksiyon planı', Icons.check_circle_outline_rounded), ('Ne söylemen gerektiği', Icons.chat_bubble_outline_rounded), ('Kaçınman gerekenler', Icons.warning_amber_rounded), ('Ek bakışlar (rüya, zamanlama, sezgisel)', Icons.visibility_outlined)];
    return RelateyCard(backgroundColor: RelateyColors.primarySurface, borderColor: RelateyColors.primary.withValues(alpha: 0.2), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Detaylı yorumda:', style: RelateyTypography.titleMedium.copyWith(color: RelateyColors.primary)),
      const SizedBox(height: RelateySpacing.lg),
      ...benefits.map((benefit) => Padding(padding: const EdgeInsets.only(bottom: RelateySpacing.md), child: Row(children: [Icon(benefit.$2, color: RelateyColors.primary, size: 20), const SizedBox(width: RelateySpacing.md), Expanded(child: Text(benefit.$1, style: RelateyTypography.bodyMedium))]))),
    ]));
  }
  
  Widget _buildCreditPacks() => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Text('Kredi paketi seç', style: RelateyTypography.titleMedium),
    const SizedBox(height: RelateySpacing.lg),
    ...List.generate(_packs.length, (index) {
      final pack = _packs[index];
      final isSelected = _selectedPackIndex == index;
      return Padding(padding: const EdgeInsets.only(bottom: RelateySpacing.sm), child: GestureDetector(onTap: () => setState(() => _selectedPackIndex = index), child: Container(
        padding: const EdgeInsets.all(RelateySpacing.lg),
        decoration: BoxDecoration(color: isSelected ? RelateyColors.primarySurface : RelateyColors.surface, borderRadius: RelateyRadii.borderRadiusMd, border: Border.all(color: isSelected ? RelateyColors.primary : RelateyColors.border, width: isSelected ? 2 : 1)),
        child: Row(children: [
          Container(width: 24, height: 24, decoration: BoxDecoration(shape: BoxShape.circle, color: isSelected ? RelateyColors.primary : Colors.transparent, border: Border.all(color: isSelected ? RelateyColors.primary : RelateyColors.border, width: 2)), child: isSelected ? const Icon(Icons.check, size: 16, color: Colors.white) : null),
          const SizedBox(width: RelateySpacing.lg),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [Text('${pack.credits} Kredi', style: RelateyTypography.titleMedium), if (pack.isDefault) ...[const SizedBox(width: RelateySpacing.sm), Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2), decoration: BoxDecoration(color: RelateyColors.primary, borderRadius: BorderRadius.circular(4)), child: Text('Popüler', style: RelateyTypography.labelSmall.copyWith(color: Colors.white)))]]),
            const SizedBox(height: 2),
            Text('${pack.credits} detaylı yorum', style: RelateyTypography.bodySmall),
          ])),
          Text(pack.price, style: RelateyTypography.titleMedium.copyWith(color: RelateyColors.primary)),
        ]),
      )));
    }),
  ]);
  
  Widget _buildProOption() => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Row(children: [const Expanded(child: Divider()), Padding(padding: const EdgeInsets.symmetric(horizontal: RelateySpacing.lg), child: Text('veya', style: RelateyTypography.bodySmall)), const Expanded(child: Divider())]),
    const SizedBox(height: RelateySpacing.lg),
    SecondaryButton(label: 'Pro – ${_proPack.price} (Sınırsız)', onPressed: _onProTap),
  ]);
  
  Widget _buildPurchaseButton() => PrimaryButton(label: 'Satın Al – ${_packs[_selectedPackIndex].price}', onPressed: _onPurchaseTap);
  
  Widget _buildDevSimulateButton() => Container(
    padding: const EdgeInsets.all(RelateySpacing.md),
    decoration: BoxDecoration(color: RelateyColors.warning.withValues(alpha: 0.1), borderRadius: RelateyRadii.borderRadiusMd, border: Border.all(color: RelateyColors.warning.withValues(alpha: 0.3))),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [const Icon(Icons.bug_report_outlined, size: 18, color: RelateyColors.warning), const SizedBox(width: RelateySpacing.sm), Text('DEV ONLY', style: RelateyTypography.labelMedium.copyWith(color: RelateyColors.warning))]),
      const SizedBox(height: RelateySpacing.md),
      SizedBox(width: double.infinity, child: TextButton(onPressed: _onSimulatePurchase, style: TextButton.styleFrom(backgroundColor: RelateyColors.warning.withValues(alpha: 0.2)), child: const Text('Simulate +3 credits', style: TextStyle(color: RelateyColors.textPrimary)))),
    ]),
  );
  
  void _onPurchaseTap() => _showComingSoonDialog();
  void _onProTap() => _showComingSoonDialog();
  
  Future<void> _onSimulatePurchase() async {
    final controller = ref.read(entitlementsControllerProvider.notifier);
    await controller.addCredits(3);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('+3 kredi eklendi (test)'), behavior: SnackBarBehavior.floating));
      if (widget.decisionId != null) context.go('/decision/${widget.decisionId}/summary'); else context.pop();
    }
  }
  
  void _showComingSoonDialog() => showDialog(context: context, builder: (context) => AlertDialog(title: const Text('Yakında'), content: const Text('Satın alma özelliği yakında eklenecek. Test için "Simulate +3 credits" butonunu kullanabilirsin.'), actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Tamam'))]));
}
