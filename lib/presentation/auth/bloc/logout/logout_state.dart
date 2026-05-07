part of 'logout_bloc.dart';

@freezed
class LogoutState with _$LogoutState {
  const factory LogoutState.initial() = _Initial;
  const factory LogoutState.loading() = Loading;
  const factory LogoutState.success() = Success;
  const factory LogoutState.error(String message) = Error;
}
