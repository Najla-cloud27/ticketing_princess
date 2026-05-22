import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ticketing_princes/data/datasource/auth_remote_datasource.dart';

part 'logout_event.dart';
part 'logout_state.dart';
part 'logout_bloc.freezed.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final AuthRemoteDatasource _authRemoteDatasource;

  LogoutBloc(this._authRemoteDatasource) : super(_Initial()) {
    on<_Logout>((event, emit) async {
      emit(_Loading());

      final response = await _authRemoteDatasource.logout();

      response.fold((error) => emit(_Error(error)), (data) => emit(_Success()));
    });
  }
}
