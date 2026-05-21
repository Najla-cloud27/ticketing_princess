import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sync_order_event.dart';
part 'sync_order_state.dart';
part 'sync_order_bloc.freezed.dart';

class SyncOrderBloc extends Bloc<SyncOrderEvent, SyncOrderState> {
  SyncOrderBloc() : super(_Initial()) {
    on<SyncOrderEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
