// // domain/entities/currency_entity.dart
// import 'package:equatable/equatable.dart';

// class CurrencyEntity extends Equatable {
//   final String? id;
//   final String? name;
//   final String? code;
//   final String? symbol;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;

//   const CurrencyEntity({
//     this.id,
//     this.name,
//     this.code,
//     this.symbol,
//     this.createdAt,
//     this.updatedAt,
//   });

//   @override
//   List<Object?> get props => [
//         id,
//         name,
//         code,
//         symbol,
//         createdAt,
//         updatedAt,
//       ];
// }

// class CurrencyResponseEntity extends Equatable {
//   final List<CurrencyEntity>? data;
//   final int? count;
//   final int? total;
//   final int? page;
//   final int? pageCount;

//   const CurrencyResponseEntity({
//     this.data,
//     this.count,
//     this.total,
//     this.page,
//     this.pageCount,
//   });

//   @override
//   List<Object?> get props => [data, count, total, page, pageCount];
// }
