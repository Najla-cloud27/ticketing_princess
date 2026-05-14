import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ticketing_princes/data/datasource/category_remote_datasource.dart';
import 'package:ticketing_princes/data/model/response/category_response_model.dart';

part 'category_event.dart';
part 'category_state.dart';
part 'category_bloc.freezed.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRemoteDatasource categoryRemoteDatasource;

  CategoryBloc(this.categoryRemoteDatasource) : super(_Initial()) {
    on<_Fetch>((event, emit) async {
      emit(_Loading());

      final response = await categoryRemoteDatasource.getCategories();

      response.fold(
        (error) => emit(_Error(error)),
        (data) => emit(_Success(data.data ?? [])),
      );
    });
  }
}
