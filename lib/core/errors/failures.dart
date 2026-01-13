import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  const Failure(this.message);
  final String message;
  @override
  List<Object?> get props => [message];
}

final class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'Bağlantı hatası']);
}

final class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Sunucu hatası']);
}

final class AuthFailure extends Failure {
  const AuthFailure([super.message = 'Oturum hatası']);
}

final class PaywallFailure extends Failure {
  const PaywallFailure({
    this.reason = 'PAYWALL_REQUIRED',
    this.decisionId,
    this.action,
  }) : super('Premium gerekli');
  final String reason;
  final String? decisionId;
  final String? action;
}

final class NotFoundFailure extends Failure {
  const NotFoundFailure([super.message = 'Bulunamadı']);
}

final class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Cache hatası']);
}
