part of 'sync_order_bloc.dart';

@freezed
class SyncOrderEvent with _$SyncOrderEvent {
  const factory SyncOrderEvent.started() = _Started;
  const factory SyncOrderEvent.syncOrders() = _SyncOrders;
}
