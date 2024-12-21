part of 'get_products_bloc.dart';

enum GetProductsStatus { initial, success, failure }

final class GetProductsState extends Equatable {
  const GetProductsState({
    this.status,
    this.products = const <ProductModel>[],
    this.amount = const <int>[],
    this.pagination,
    this.hasReachedMax = false,
    this.message,
  });

  final GetProductsStatus? status;
  final List<ProductModel> products;
  final List<int> amount;
  final Pagination? pagination;
  final bool hasReachedMax;

  final String? message;

  GetProductsState copyWith({
    GetProductsStatus? status,
    List<ProductModel>? products,
    List<int>? amount,
    bool? hasReachedMax,
    String? message,
    Pagination? pagination,
  }) {
    return GetProductsState(
      status: status ?? this.status,
      products: products ?? this.products,
      amount: amount ?? this.amount,
      message: message ?? this.message,
      pagination: pagination ?? this.pagination,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''
    status: $status, hasReachedMax: $hasReachedMax, data: ${products.length},
    pagination current : ${pagination?.currentPage}, total : ${pagination?.totalPages},
    message : ${message.toString()},
    ''';
  }

  @override
  List<Object> get props => [
        products,
        amount,
        hasReachedMax,
        status ?? GetProductsStatus.initial,
        pagination ?? const Pagination(),
        message ?? '',
      ];
}
