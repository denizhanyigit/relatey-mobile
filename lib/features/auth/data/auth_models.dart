import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_models.freezed.dart';
part 'auth_models.g.dart';

@freezed
class AnonymousAuthRequest with _$AnonymousAuthRequest {
  const factory AnonymousAuthRequest({required String deviceId, @Default('tr') String locale}) = _AnonymousAuthRequest;
  factory AnonymousAuthRequest.fromJson(Map<String, dynamic> json) => _$AnonymousAuthRequestFromJson(json);
}

@freezed
class AuthTokenResponse with _$AuthTokenResponse {
  const factory AuthTokenResponse({required String accessToken, required String refreshToken}) = _AuthTokenResponse;
  factory AuthTokenResponse.fromJson(Map<String, dynamic> json) => _$AuthTokenResponseFromJson(json);
}

@freezed
class RefreshTokenRequest with _$RefreshTokenRequest {
  const factory RefreshTokenRequest({required String refreshToken}) = _RefreshTokenRequest;
  factory RefreshTokenRequest.fromJson(Map<String, dynamic> json) => _$RefreshTokenRequestFromJson(json);
}
