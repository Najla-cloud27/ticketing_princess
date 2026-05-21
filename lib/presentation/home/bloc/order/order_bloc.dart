import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ticketing_princes/data/datasource/auth_local_datasource.dart';
import 'package:ticketing_princes/presentation/home/model/order_item_model.dart';

part 'order_event.dart';
part 'order_state.dart';
part 'order_bloc.freezed.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(_Success([], 0, 0, 0, '', 0, '')) {
    on<_AddPaymentMethod>((event, emit) async {
      emit(_Loading());
      final dataUser = await AuthLocalDatasource().getAuthData();
      emit(
        _Success(
          event.orders.fold(
            0,
            (previousValue, element) => previousValue + element.quantity,
          ),
          event.orders.fold(
            0,
            (previousValue, element) =>
                previousValue + (element.quantity * element.product.price!),
          ),
          event.paymentMethod,
          dataUser.user!.id!,
          dataUser.user!.name!,
        ),
      );
    });
  }
}
