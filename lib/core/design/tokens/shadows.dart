import 'package:flutter/material.dart';
import 'colors.dart';

abstract final class RelateyShadows {
  // Basic elevation shadows
  static const List<BoxShadow> none = [];

  static const List<BoxShadow> low = [
    BoxShadow(color: RelateyColors.shadow, blurRadius: 8, offset: Offset(0, 2)),
  ];

  // Soft card shadow (very subtle, like shadow-soft in the design)
  static const List<BoxShadow> soft = [
    BoxShadow(
      color: Color(0x0A000000), // rgba(0,0,0,0.04)
      blurRadius: 30,
      offset: Offset(0, 8),
    ),
  ];

  static const List<BoxShadow> card = [
    BoxShadow(color: RelateyColors.shadow, blurRadius: 8, offset: Offset(0, 2)),
  ];

  static const List<BoxShadow> elevated = [
    BoxShadow(color: RelateyColors.shadow, blurRadius: 12, offset: Offset(0, 4)),
    BoxShadow(color: RelateyColors.shadowMedium, blurRadius: 4, offset: Offset(0, 1)),
  ];

  static const List<BoxShadow> modal = [
    BoxShadow(color: RelateyColors.shadowMedium, blurRadius: 24, offset: Offset(0, 8)),
    BoxShadow(color: RelateyColors.shadow, blurRadius: 8, offset: Offset(0, 2)),
  ];

  // Navigation bar shadow (floating pill nav)
  static const List<BoxShadow> navigation = [
    BoxShadow(
      color: Color(0x1F000000), // rgba(0,0,0,0.12)
      blurRadius: 32,
      offset: Offset(0, 8),
    ),
  ];

  // Primary-tinted shadows for hero elements and CTAs
  static const List<BoxShadow> primarySoft = [
    BoxShadow(
      color: RelateyColors.shadowPrimary,
      blurRadius: 40,
      offset: Offset(0, 20),
      spreadRadius: -10,
    ),
  ];

  static const List<BoxShadow> primaryMedium = [
    BoxShadow(
      color: RelateyColors.shadowPrimary,
      blurRadius: 24,
      offset: Offset(0, 8),
    ),
  ];

  // Hero image card shadow (soft, primary-tinted)
  static const List<BoxShadow> heroCard = [
    BoxShadow(
      color: RelateyColors.shadowPrimary,
      blurRadius: 40,
      offset: Offset(0, 16),
      spreadRadius: -8,
    ),
  ];
}
