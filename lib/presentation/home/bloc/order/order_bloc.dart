import 'package:ticketing_princes/data/datasource/auth_local_datasource.dart';
import 'package:ticketing_princes/presentation/home/model/order_item_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_event.dart';
part 'order_state.dart';
part 'order_bloc.freezed.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(_Success([], 0, 0, 0, "", 0, "")) {
    on<_AddPaymentMethod>((event, emit) async {
      emit(_Loading());
      final dataUser = await AuthLocalDatasource().getAuthData();
      emit(
        _Success(
          event.orders,
          event.orders.fold(
            0,
            (previousValue, element) => previousValue + element.quantity,
          ),
          event.orders.fold(
            0,
            (previousValue, element) =>
                previousValue + (element.quantity * element.product.price!),
          ),
          0,
          event.paymentMethod,
          dataUser.user!.id!,
          dataUser.user!.name!,
        ),
      );
    });

    on<_AddNominalPayment>((event, emit) async {
      var currentState = state as _Success;
      emit(_Loading());
      emit(
        _Success(
          currentState.orders,
          currentState.totalQuantity,
          currentState.totalPrice,
          event.nominalPayment,
          currentState.paymentMethod,
          currentState.cashierId,
          currentState.cashierName,
        ),
      );
    });

    on<_Started>((event, emit) async {
      emit(_Loading());
      emit(_Success([], 0, 0, 0, "", 0, ""));
    });
  }
}
