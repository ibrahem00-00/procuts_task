import '/core/base_classes/pagination.dart';

class PaginationModel extends Pagination {
  const PaginationModel({
    super.currentPage,
    super.productsPerPage,
    super.totalPages,
    super.total,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) =>
      PaginationModel(
        currentPage: json['current_page'],
        productsPerPage: json['products_per_page'],
        totalPages: json['total_pages'],
        total: json['total'],
      );

  @override
  Map<String, dynamic> toJson() => {
        'current_page': currentPage,
        'products_per_page': productsPerPage,
        'total_pages': totalPages,
        'total': total,
      };
}
