import 'package:equatable/equatable.dart';

import '/core/base_classes/pagination.dart';

class BaseListResponse extends Equatable {
  const BaseListResponse({
    this.data,
    this.message,
    this.success,
    this.pagination,
    this.statusCode,
    this.count,
    this.total,
    this.page,
    this.pageCount,
  });

  final List<dynamic>? data;
  final String? message;
  final bool? success;
  final Pagination? pagination;
  final num? statusCode;
  final num? count;
  final num? total;
  final num? page;
  final num? pageCount;

  @override
  List<Object?> get props => [
        data,
        message,
        success,
        pagination,
        statusCode,
        count,
        total,
        page,
        pageCount,
      ];
}
