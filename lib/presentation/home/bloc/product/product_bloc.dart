import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ticketing_princes/data/datasource/product_local_datasource.dart';
import 'package:ticketing_princes/data/datasource/product_remote_datasource.dart';
import 'package:ticketing_princes/data/model/request/create_ticket_request_model.dart';
import 'package:ticketing_princes/data/model/response/product_reponse_model.dart';

part 'product_event.dart';
part 'product_state.dart';
part 'product_bloc.freezed.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRemoteDatasource productRemoteDatasource;
  final ProductLocalDatasource productLocalDatasource;
  ProductBloc(this.productRemoteDatasource, this.productLocalDatasource)
    : super(_Initial()) {
    List<Product> products = [];

    on<_GetProducts>((event, emit) async {
      emit(_Loading());
      final response = await productRemoteDatasource.getProduct();
      response.fold(
        (error) => emit(_Error(error)),
        (data) => emit(_Success(data.data ?? [])),
      );
    });

    on<_SyncProducts>((event, emit) async {
      final List<ConnectivityResult> connectivityResult = await (Connectivity()
          .checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.none)) {
        emit(_Error('Ga ada internet cuy'));
      } else {
        emit(_Loading());
        final response = await productRemoteDatasource.getProduct();
        productLocalDatasource.removeAllProduct();
        productLocalDatasource.insertAllProducts(
          response.getOrElse(() => ProductResponseModel(data: [])).data ?? [],
        );
        products =
            response.getOrElse(() => ProductResponseModel(data: [])).data ?? [];
        emit(_Success(products));
      }
    });

    on<_GetProductsLocal>((event, emit) async {
      emit(_Loading());
      final localProducts = await productLocalDatasource.getAllProducts();
      products = localProducts;
      emit(_Success(products));
    });

    // Create Ticket
    on<_CreateTicket>((event, emit) async {
      emit(_Loading());
      final requestData = CreateTicketRequestModel(
        name: event.model.name,
        price: event.model.price,
        stock: event.model.stock,
        categoryId: event.model.categoryId,
        criteria: event.model.criteria!.toLowerCase(),
      );
      final response = await productRemoteDatasource.createTicket(requestData);

      response.fold((error) => emit(_Error(error)), (data) {
        products.add(data.data);
        emit(_Success(products));
      });
    });

    on<_UpdateTicket>((event, emit) async {
      emit(_Loading());
      final requestData = CreateTicketRequestModel(
        name: event.model.name,
        price: event.model.price,
        stock: event.model.stock,
        categoryId: event.model.categoryId,
        criteria: event.model.criteria!.toLowerCase(),
      );
      final response = await productRemoteDatasource.updateTicket(
        requestData,
        event.model.id!,
      );

      response.fold((error) => emit(_Error(error)), (success) {
        final updatedProducts = products.map((oldProduct) {
          if (oldProduct.id == event.model.id) {
            return Product(
              id: oldProduct.id,
              name: event.model.name,
              price: event.model.price,
              category: oldProduct.category,
              categoryId: oldProduct.categoryId,
              createdAt: oldProduct.createdAt,
              updatedAt: oldProduct.updatedAt,
            );
          }

          return oldProduct;
        }).toList();

        products = updatedProducts;

        emit(_Success(updatedProducts));
      });
    });

    on<_DeleteTicket>((event, emit) async {
      emit(_Loading());
      final response = await productRemoteDatasource.deleteTicket(event.id);
      response.fold((error) => emit(_Error(error)), (success) {
        products.removeWhere((products) => products.id == event.id);
        emit(_Success(products));
      });
    });
  }
}
