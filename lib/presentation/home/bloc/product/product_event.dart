part of 'product_bloc.dart';

@freezed
class ProductEvent with _$ProductEvent {
  const factory ProductEvent.started() = _Started;
  const factory ProductEvent.getProducts() = _GetProducts;
  const factory ProductEvent.syncProducts() = _SyncProducts;
  const factory ProductEvent.getLocalProducts() = _GetProductsLocal;

  // add ticket
  const factory ProductEvent.createTicket(ProductResponseModel product) =
      _CreateTicket;

  const factory ProductEvent.updateTicket(ProductResponseModel product) =
      _UpdateTicket;
  const factory ProductEvent.deleteTicket(int id) = _DeleteTicket;
}
