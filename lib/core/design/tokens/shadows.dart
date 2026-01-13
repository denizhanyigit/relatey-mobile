import 'package:flutter/material.dart';
import 'colors.dart';

abstract final class RelateyShadows {
  static const List<BoxShadow> card = [BoxShadow(color: RelateyColors.shadow, blurRadius: 8, offset: Offset(0, 2))];
  static const List<BoxShadow> elevated = [BoxShadow(color: RelateyColors.shadow, blurRadius: 12, offset: Offset(0, 4)), BoxShadow(color: RelateyColors.shadowMedium, blurRadius: 4, offset: Offset(0, 1))];
  static const List<BoxShadow> modal = [BoxShadow(color: RelateyColors.shadowMedium, blurRadius: 24, offset: Offset(0, 8)), BoxShadow(color: RelateyColors.shadow, blurRadius: 8, offset: Offset(0, 2))];
  static const List<BoxShadow> none = [];
}
