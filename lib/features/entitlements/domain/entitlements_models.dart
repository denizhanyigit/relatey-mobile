import 'package:freezed_annotation/freezed_annotation.dart';

part 'entitlements_models.freezed.dart';
part 'entitlements_models.g.dart';

@freezed
class Entitlements with _$Entitlements {
  const Entitlements._();
  const factory Entitlements({@Default(false) bool hasPro, @Default(0) int credits, int? expiresAt, int? updatedAt}) = _Entitlements;
  factory Entitlements.fromJson(Map<String, dynamic> json) => _$EntitlementsFromJson(json);
  bool get isExpired => expiresAt != null && DateTime.now().millisecondsSinceEpoch > expiresAt!;
  bool get hasPremiumAccess => hasPro || credits > 0;
}

@freezed
class EntitlementsResponse with _$EntitlementsResponse {
  const factory EntitlementsResponse({required bool hasPro, required int credits, int? expiresAt}) = _EntitlementsResponse;
  factory EntitlementsResponse.fromJson(Map<String, dynamic> json) => _$EntitlementsResponseFromJson(json);
}
