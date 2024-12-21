part of 'get_products_bloc.dart';

sealed class GetProductsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetProductsEventFetched extends GetProductsEvent {
  final FilterParams data;
  GetProductsEventFetched(this.data);
}
