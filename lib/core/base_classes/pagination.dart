import 'package:equatable/equatable.dart';

class Pagination extends Equatable {
  final int? currentPage;
  final int? totalPages;
  final int? productsPerPage;
  final int? total;

  const Pagination({
    this.currentPage,
    this.totalPages,
    this.productsPerPage,
    this.total,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      currentPage: json['current_page'] as int?,
      totalPages: json['total_pages'] as int?,
      productsPerPage:
          json['products_per_page'] as int?, // Assuming this is perPage
      total: json['total'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': currentPage,
      'products_per_page': productsPerPage,
      'total_pages': totalPages,
      'total': total,
    };
  }

  @override
  List<Object?> get props => [
        currentPage,
        totalPages,
        productsPerPage,
        total,
      ];
}
