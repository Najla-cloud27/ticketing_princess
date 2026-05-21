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

  List<ProductResponseModel> products = [];

  ProductBloc(this.productRemoteDatasource, this.productLocalDatasource)
    : super(const _Initial()) {
    // GET PRODUCTS FROM API
    on<_GetProducts>((event, emit) async {
      emit(const _Loading());

      final response = await productRemoteDatasource.getProduct();

      response.fold(
        (error) {
          emit(_Error(error));
        },
        (data) {
          products = data.data ?? [];
          emit(_Success(products));
        },
      );
    });

    // SYNC PRODUCTS
    on<_SyncProducts>((event, emit) async {
      emit(const _Loading());

      final connectivityResult = await Connectivity().checkConnectivity();

      if (connectivityResult.contains(ConnectivityResult.none)) {
        emit(const _Error('Tidak ada koneksi internet'));
        return;
      }

      final response = await productRemoteDatasource.getProduct();

      response.fold(
        (error) {
          emit(_Error(error));
        },
        (data) async {
          final productData = data.data ?? [];

          // Hapus local data lama
          await productLocalDatasource.removeAllProduct();

          // Simpan data baru
          await productLocalDatasource.insertAllProducts(productData);

          products = productData;

          emit(_Success(products));
        },
      );
    });

    // GET LOCAL PRODUCTS
    on<_GetProductsLocal>((event, emit) async {
      emit(const _Loading());

      final localProducts = await productLocalDatasource.getAllProducts();

      products = localProducts;

      emit(_Success(products));
    });

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
        final updateProduct = products.map((product) {
          if (product.id == event.model.id) {
            return success.data as Product;
          }
          return product;
        }).toList();
        products = updateProduct;
        emit(_Success(products));
      });
    });

    // DELETE TICKET
    on<_DeleteTicket>((event, emit) async {
      emit(const _Loading());

      final response = await productRemoteDatasource.deleteTicket(event.id);

      response.fold(
        (error) {
          emit(_Error(error));
        },
        (_) {
          products.removeWhere((product) => product.id == event.id);

          emit(_Success(List.from(products)));
        },
      );
    });
  }
}
