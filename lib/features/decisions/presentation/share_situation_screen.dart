import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/design/tokens/colors.dart';
import '../../../core/design/tokens/radii.dart';
import '../../../core/design/tokens/shadows.dart';
import '../../../core/design/tokens/spacing.dart';
import '../../../core/design/tokens/typography.dart';
import '../../../core/di/providers.dart';

/// Share Your Situation Screen - Step 2 in the decision flow.
///
/// This screen is designed to reduce writing anxiety and make the user
/// feel safe sharing their situation. It avoids form-like patterns and
/// creates a calm, breathing space for emotional input.
class ShareSituationScreen extends ConsumerStatefulWidget {
  const ShareSituationScreen({super.key, required this.situationType});

  final String situationType;

  @override
  ConsumerState<ShareSituationScreen> createState() =>
      _ShareSituationScreenState();
}

class _ShareSituationScreenState extends ConsumerState<ShareSituationScreen> {
  final _situationController = TextEditingController();
  final _personController = TextEditingController();
  final _situationFocusNode = FocusNode();
  final _personFocusNode = FocusNode();
  bool _isLoading = false;

  @override
  void dispose() {
    _situationController.dispose();
    _personController.dispose();
    _situationFocusNode.dispose();
    _personFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    final keyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      backgroundColor: RelateyColors.background,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Header section (fixed)
            _buildHeader(context),

            // Main content (scrollable)
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: RelateySpacing.screenHorizontal,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: RelateySpacing.sm),

                    // Title
                    _buildTitle(),

                    const SizedBox(height: RelateySpacing.xxl),

                    // "Who is this about?" optional input
                    _buildPersonInput(),

                    const SizedBox(height: RelateySpacing.xxl),

                    // Main textarea - the emotional core
                    _buildSituationTextarea(),

                    // Breathing room before CTA
                    const SizedBox(height: RelateySpacing.xxxl),
                  ],
                ),
              ),
            ),

            // Bottom CTA section (fixed)
            _buildBottomSection(bottomPadding, keyboardVisible),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        RelateySpacing.screenHorizontal - 8, // Offset for icon button padding
        RelateySpacing.lg,
        RelateySpacing.screenHorizontal,
        RelateySpacing.sm,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back button
          IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(
              Icons.chevron_left_rounded,
              size: 28,
              color: RelateyColors.textPrimary,
            ),
            style: IconButton.styleFrom(
              padding: const EdgeInsets.all(8),
            ),
          ),

          // Step indicator (3 dots, step 2 active)
          const _StepIndicator(currentStep: 1, totalSteps: 3),

          // Empty spacer for balance
          const SizedBox(width: 44),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Share Your\n',
            style: RelateyTypography.displayLarge.copyWith(
              color: RelateyColors.textHeading,
              height: 1.1,
            ),
          ),
          TextSpan(
            text: 'Situation',
            style: RelateyTypography.displayLarge.copyWith(
              color: RelateyColors.textHeading,
              height: 1.1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPersonInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label with optional indicator
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: RelateySpacing.sm),
          child: Row(
            children: [
              Text(
                'Who is this about?',
                style: RelateyTypography.titleSmall.copyWith(
                  color: RelateyColors.textPrimary,
                ),
              ),
              const SizedBox(width: RelateySpacing.sm),
              Text(
                '(Optional)',
                style: RelateyTypography.bodyMedium.copyWith(
                  color: RelateyColors.textSecondary,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),

        // Input container
        Container(
          decoration: BoxDecoration(
            color: RelateyColors.surface,
            borderRadius: RelateyRadii.borderRadiusLg,
            boxShadow: RelateyShadows.soft,
          ),
          child: TextField(
            controller: _personController,
            focusNode: _personFocusNode,
            style: RelateyTypography.bodyLarge.copyWith(
              color: RelateyColors.textPrimary,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              hintText: 'e.g. Partner, Ex, Date',
              hintStyle: RelateyTypography.bodyLarge.copyWith(
                color: RelateyColors.textSecondary.withValues(alpha: 0.6),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 16, right: 8),
                child: Icon(
                  Icons.favorite_outline_rounded,
                  color: RelateyColors.primary.withValues(alpha: 0.6),
                  size: 22,
                ),
              ),
              prefixIconConstraints: const BoxConstraints(
                minWidth: 48,
                minHeight: 48,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: RelateySpacing.lg,
                vertical: RelateySpacing.lg,
              ),
            ),
            textInputAction: TextInputAction.next,
            onSubmitted: (_) => _situationFocusNode.requestFocus(),
          ),
        ),
      ],
    );
  }

  Widget _buildSituationTextarea() {
    return Container(
      constraints: const BoxConstraints(minHeight: 200),
      decoration: BoxDecoration(
        color: RelateyColors.surface,
        borderRadius: RelateyRadii.borderRadiusXxl,
        boxShadow: RelateyShadows.soft,
      ),
      child: TextField(
        controller: _situationController,
        focusNode: _situationFocusNode,
        maxLines: null,
        minLines: 8,
        style: RelateyTypography.bodyLarge.copyWith(
          color: RelateyColors.textPrimary,
          height: 1.6,
        ),
        decoration: InputDecoration(
          hintText: 'What happened?',
          hintStyle: RelateyTypography.bodyLarge.copyWith(
            color: RelateyColors.textSecondary.withValues(alpha: 0.4),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(RelateySpacing.xxl),
        ),
        textInputAction: TextInputAction.newline,
      ),
    );
  }

  Widget _buildBottomSection(double bottomPadding, bool keyboardVisible) {
    return Container(
      decoration: BoxDecoration(
        color: RelateyColors.background,
        // Subtle gradient fade at top
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            RelateyColors.background.withValues(alpha: 0),
            RelateyColors.background,
          ],
          stops: const [0.0, 0.15],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          RelateySpacing.screenHorizontal,
          RelateySpacing.lg,
          RelateySpacing.screenHorizontal,
          bottomPadding + RelateySpacing.xxl,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Primary CTA button
            _buildCTAButton(),

            const SizedBox(height: RelateySpacing.md),

            // Reassurance microcopy (hide when keyboard is visible)
            if (!keyboardVisible) _buildReassuranceCopy(),
          ],
        ),
      ),
    );
  }

  Widget _buildCTAButton() {
    return SizedBox(
      width: double.infinity,
      height: 64,
      child: ElevatedButton(
        onPressed: _isLoading ? null : _onSubmit,
        style: ElevatedButton.styleFrom(
          backgroundColor: RelateyColors.primary,
          foregroundColor: RelateyColors.textOnPrimary,
          elevation: 0,
          shadowColor: RelateyColors.shadowPrimary,
          padding: const EdgeInsets.symmetric(
            horizontal: RelateySpacing.xxl,
            vertical: RelateySpacing.lg,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: RelateyRadii.borderRadiusLg,
          ),
        ),
        child: _isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(
                      RelateyColors.textOnPrimary),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Get clarity',
                    style: RelateyTypography.buttonLarge.copyWith(
                      color: RelateyColors.textOnPrimary,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),

                  // Arrow icon in subtle container
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: RelateyRadii.borderRadiusMd,
                    ),
                    child: const Icon(
                      Icons.arrow_forward_rounded,
                      size: 20,
                      color: RelateyColors.textOnPrimary,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildReassuranceCopy() {
    return Column(
      children: [
        const SizedBox(height: RelateySpacing.sm),

        // Primary reassurance text
        Text(
          "You'll get a clear next step, not a long lecture.",
          style: RelateyTypography.bodyMedium.copyWith(
            color: RelateyColors.primary,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: RelateySpacing.sm),

        // Privacy note with lock icon
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lock_outline_rounded,
              size: 14,
              color: RelateyColors.textSecondary.withValues(alpha: 0.6),
            ),
            const SizedBox(width: RelateySpacing.xs),
            Text(
              'Your thoughts are safe and private',
              style: RelateyTypography.bodySmall.copyWith(
                color: RelateyColors.textSecondary.withValues(alpha: 0.6),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _onSubmit() async {
    final situationText = _situationController.text.trim();

    // Gentle validation - don't be harsh
    if (situationText.isEmpty) {
      _showGentleError('Share a little about what happened');
      return;
    }

    setState(() => _isLoading = true);

    try {
      final controller = ref.read(createDecisionControllerProvider.notifier);
      final decision = await controller.create(
        situationType: widget.situationType,
        contextText: situationText,
        personLabel: _personController.text.trim().isEmpty
            ? null
            : _personController.text.trim(),
      );

      if (decision != null && mounted) {
        context.go('/decision/${decision.id}/summary');
      }
    } catch (e) {
      if (mounted) {
        _showGentleError('Something went wrong. Please try again.');
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _showGentleError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: RelateyTypography.bodyMedium.copyWith(
            color: RelateyColors.textOnPrimary,
          ),
        ),
        backgroundColor: RelateyColors.textSecondary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: RelateyRadii.borderRadiusMd,
        ),
        margin: const EdgeInsets.all(RelateySpacing.screenHorizontal),
      ),
    );
  }
}

/// Step indicator showing progress through the flow.
///
/// Displays dots for each step, with the current step highlighted.
class _StepIndicator extends StatelessWidget {
  const _StepIndicator({
    required this.currentStep,
    required this.totalSteps,
  });

  final int currentStep; // 0-indexed
  final int totalSteps;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(totalSteps, (index) {
        final isActive = index == currentStep;
        final isPast = index < currentStep;

        return Padding(
          padding: EdgeInsets.only(
            right: index < totalSteps - 1 ? RelateySpacing.sm : 0,
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOutCubic,
            height: 6,
            width: isActive ? 32 : 6,
            decoration: BoxDecoration(
              color: isActive || isPast
                  ? RelateyColors.primary
                  : RelateyColors.primary.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        );
      }),
    );
  }
}
