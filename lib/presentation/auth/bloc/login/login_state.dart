part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = Loading;
  const factory LoginState.success(AuthResponseModel authResponseModel) =
      Success;
  const factory LoginState.error(String message) = Error;
}
