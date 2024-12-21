import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int? id;
  final String? status;
  final String? name;
  final String? arName;
  final String? categoryName;
  final String? categorySlug;
  final String? categoryNameAr;
  final String? slug;
  final String? sku;
  final String? salePrice;
  final String? price;
  final MainImageEntity? mainImg;
  final String? type;
  final String? availability;

  const ProductEntity({
    this.id,
    this.status,
    this.name,
    this.arName,
    this.categoryName,
    this.categorySlug,
    this.categoryNameAr,
    this.slug,
    this.sku,
    this.salePrice,
    this.price,
    this.mainImg,
    this.type,
    this.availability,
  });

  @override
  List<Object?> get props => [
        id,
        status,
        name,
        arName,
        categoryName,
        categorySlug,
        categoryNameAr,
        slug,
        sku,
        salePrice,
        price,
        mainImg,
        type,
        availability,
      ];
}

class MainImageEntity extends Equatable {
  final String? src;
  final String? alt;
  final String? caption;
  final String? title;

  const MainImageEntity({
    this.src,
    this.alt,
    this.caption,
    this.title,
  });

  @override
  List<Object?> get props => [src, alt, caption, title];
}

class PaginationEntity extends Equatable {
  final int? total;
  final int? totalPages;
  final int? currentPage;
  final int? productsPerPage;

  const PaginationEntity({
    this.total,
    this.totalPages,
    this.currentPage,
    this.productsPerPage,
  });

  @override
  List<Object?> get props => [total, totalPages, currentPage, productsPerPage];
}
