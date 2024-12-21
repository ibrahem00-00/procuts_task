import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:procuts_task/core/error/failure_msg.dart';
import 'package:procuts_task/core/params/filter_params.dart';
import 'package:procuts_task/features/products/data/models/product_resp_model.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../domain/usecases/get_products_use_case.dart';
import '/core/base_classes/base_list_response.dart';
import '/core/base_classes/pagination.dart';
import '/core/error/failures.dart';

part 'get_products_event.dart';
part 'get_products_state.dart';

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class GetProductsBloc extends Bloc<GetProductsEvent, GetProductsState> {
  final GetProductsUseCase getProductsUseCase;
  GetProductsBloc({required this.getProductsUseCase})
      : super(const GetProductsState()) {
    on<GetProductsEventFetched>(
      _onSearchFetched,
      transformer: debounce(AppStrings.duration),
    );
  }

  Future<void> _onSearchFetched(
    GetProductsEventFetched event,
    Emitter<GetProductsState> emit,
  ) async {
    emit(state.copyWith(
      status: GetProductsStatus.initial,
      hasReachedMax: event.data.reachMax ?? false,
    ));
    if (state.hasReachedMax) return;
    try {
      if (state.status == GetProductsStatus.initial) {
        Either<Failure, BaseListResponse> response =
            await getProductsUseCase(event.data);
        return emit(response.fold(
          (failure) => state.copyWith(
            status: GetProductsStatus.failure,
            message: FailureMsg.mapFailureToMsg(failure),
          ),
          (resp) => state.copyWith(
            status: GetProductsStatus.success,
            products: resp.data as List<ProductModel>,
            pagination: resp.pagination,
            hasReachedMax:
                resp.pagination?.currentPage == resp.pagination?.totalPages,
          ),
        ));
      }
    } catch (e) {
      emit(
        state.copyWith(
            status: GetProductsStatus.failure, message: e.toString()),
      );
    }
  }
}
