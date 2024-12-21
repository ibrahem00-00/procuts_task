import 'package:procuts_task/core/base_classes/base_list_response.dart';
import 'package:procuts_task/core/base_classes/pagination.dart';
import 'package:procuts_task/features/products/domain/entities/product_entity.dart';

class ProductsRespModel extends BaseListResponse {
  const ProductsRespModel(
      {super.data,
      super.message,
      super.success,
      super.count,
      super.page,
      super.pagination,
      super.pageCount,
      super.total});

  factory ProductsRespModel.fromJson(Map<String, dynamic> json) {
    return ProductsRespModel(
        data: (json['products'] as List)
            .map((item) => ProductModel.fromJson(item))
            .toList(),
        message: json['message'],
        success: json['success'],
        pagination: json['pagination'] != null
            ? Pagination.fromJson(json['pagination'])
            : null);
  }
}

class ProductModel extends ProductEntity {
  const ProductModel({
    super.id,
    super.status,
    super.name,
    super.arName,
    super.categoryName,
    super.categorySlug,
    super.categoryNameAr,
    super.slug,
    super.sku,
    super.salePrice,
    super.price,
    super.mainImg,
    super.type,
    super.availability,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      status: json['status'],
      name: json['name'],
      arName: json['ar_name'],
      categoryName: json['category_name'],
      categorySlug: json['category_slug'],
      categoryNameAr: json['category_name_ar'],
      slug: json['slug'],
      sku: json['sku'],
      salePrice: json['sale_price'],
      price: json['price'],
      mainImg: json['main_img'] != null
          ? MainImageModel.fromJson(json['main_img'])
          : null,
      type: json['type'],
      availability: json['availability'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
      'name': name,
      'ar_name': arName,
      'category_name': categoryName,
      'category_slug': categorySlug,
      'category_name_ar': categoryNameAr,
      'slug': slug,
      'sku': sku,
      'sale_price': salePrice,
      'price': price,
      'main_img': mainImg,
      'type': type,
      'availability': availability,
    };
  }
}

class MainImageModel extends MainImageEntity {
  const MainImageModel({
    super.src,
    super.alt,
    super.caption,
    super.title,
  });

  factory MainImageModel.fromJson(Map<String, dynamic> json) {
    return MainImageModel(
      src: json['src'],
      alt: json['alt'],
      caption: json['caption'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'src': src,
      'alt': alt,
      'caption': caption,
      'title': title,
    };
  }
}

class PaginationModel extends PaginationEntity {
  const PaginationModel({
    super.total,
    super.totalPages,
    super.currentPage,
    super.productsPerPage,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) {
    return PaginationModel(
      total: json['total'],
      totalPages: json['total_pages'],
      currentPage: json['current_page'],
      productsPerPage: json['products_per_page'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'total_pages': totalPages,
      'current_page': currentPage,
      'products_per_page': productsPerPage,
    };
  }
}
