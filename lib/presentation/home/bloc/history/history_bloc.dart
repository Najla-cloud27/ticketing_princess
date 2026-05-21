import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ticketing_princes/data/datasource/product_local_datasource.dart';
import 'package:ticketing_princes/presentation/home/model/order_model.dart';

part 'history_event.dart';
part 'history_state.dart';
part 'history_bloc.freezed.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  ProductLocalDatasource _productLocalDatasource;
  HistoryBloc(this._productLocalDatasource) : super(_Initial()) {
    on<_GetHistory>((event, emit) async {
      emit(_Loading());
      final history = await _productLocalDatasource.getAllOrder();
      emit(_Success(history));
    });
  }
}
