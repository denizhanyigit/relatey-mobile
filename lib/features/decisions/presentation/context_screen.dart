import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/di/providers.dart';
import '../../../core/design/components/input_field.dart';
import '../../../core/design/components/primary_button.dart';
import '../../../core/design/tokens/colors.dart';
import '../../../core/design/tokens/spacing.dart';
import '../../../core/design/tokens/typography.dart';
import '../data/decisions_models.dart';

class ContextScreen extends ConsumerStatefulWidget {
  const ContextScreen({super.key, required this.situationType});
  final String situationType;
  @override
  ConsumerState<ContextScreen> createState() => _ContextScreenState();
}

class _ContextScreenState extends ConsumerState<ContextScreen> {
  final _contextController = TextEditingController();
  final _personController = TextEditingController();
  bool _isLoading = false;
  SituationType get _situation => SituationType.fromKey(widget.situationType);
  
  @override
  void dispose() { _contextController.dispose(); _personController.dispose(); super.dispose(); }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(icon: const Icon(Icons.arrow_back_rounded), onPressed: () => context.pop()), title: const Text('Durumu anlat')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: RelateySpacing.screenHorizontal),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: RelateySpacing.lg),
            _buildSituationBadge(),
            const SizedBox(height: RelateySpacing.xxl),
            Expanded(
              child: SingleChildScrollView(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  InputField(controller: _contextController, labelText: 'Ne oldu? Ne hissediyorsun?', hintText: 'Durumu kısaca anlat...', maxLines: 6, minLines: 4, maxLength: 500),
                  const SizedBox(height: RelateySpacing.xxl),
                  InputField(controller: _personController, labelText: 'Kişi (opsiyonel)', hintText: 'Örn: Sevgilim, Eski, Arkadaşım...', maxLines: 1),
                ]),
              ),
            ),
            Padding(padding: const EdgeInsets.only(bottom: RelateySpacing.xxl, top: RelateySpacing.lg), child: PrimaryButton(label: 'Netleş', isLoading: _isLoading, onPressed: _onSubmit)),
          ]),
        ),
      ),
    );
  }
  
  Widget _buildSituationBadge() => Container(
    padding: const EdgeInsets.symmetric(horizontal: RelateySpacing.md, vertical: RelateySpacing.sm),
    decoration: BoxDecoration(color: RelateyColors.primarySurface, borderRadius: BorderRadius.circular(8)),
    child: Text(_situation.displayName, style: RelateyTypography.labelLarge.copyWith(color: RelateyColors.primary)),
  );
  
  Future<void> _onSubmit() async {
    final contextText = _contextController.text.trim();
    if (contextText.isEmpty) { _showError('Lütfen durumu anlat'); return; }
    if (contextText.length < 10) { _showError('Biraz daha detay ekle'); return; }
    setState(() => _isLoading = true);
    try {
      final controller = ref.read(createDecisionControllerProvider.notifier);
      final decision = await controller.create(situationType: widget.situationType, contextText: contextText, personLabel: _personController.text.trim().isEmpty ? null : _personController.text.trim());
      if (decision != null && mounted) context.go('/decision/${decision.id}/summary');
    } catch (e) { if (mounted) _showError('Bir hata oluştu'); }
    finally { if (mounted) setState(() => _isLoading = false); }
  }
  
  void _showError(String message) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message), behavior: SnackBarBehavior.floating));
}
