import 'dart:io';

import 'package:equatable/equatable.dart';

class ProductParams extends Equatable {
  final String? keyWord, filterId, limit, page , productId;
  final String? name;
  final String? description;
  final String? barcodeNumber;
  final String? storeCategoryId;
  final String? currencyId;
  final String? price;
  final String? salePrice;
  final String? saleExpiresAt;
  final List<File>? files;
  final List<dynamic>? images;
  final bool? isEnabled;

  const ProductParams({
    this.keyWord,
    this.filterId,
    this.limit,
    this.page,
    this.productId,
    this.name,
    this.description,
    this.barcodeNumber,
    this.storeCategoryId,
    this.currencyId,
    this.price,
    this.salePrice,
    this.saleExpiresAt,
    this.files,
    this.isEnabled,
    this.images
  });

  @override
  List<Object?> get props => [
        keyWord,
        filterId,
        limit,
        page,
        productId,
        name,
        description,
        barcodeNumber,
        storeCategoryId,
        currencyId,
        price,
        salePrice,
        saleExpiresAt,
        files,
        isEnabled,
        images
      ];
}
