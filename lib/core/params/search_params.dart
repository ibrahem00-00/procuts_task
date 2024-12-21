class ProductSearchParams {
  final String? keyword;
  final String? categoryId;
  final String? maxPrice;
  final String? minPrice;
  final String? sortType;
  final String? sortBy;

  ProductSearchParams({
    this.keyword,
    this.categoryId,
    this.maxPrice,
    this.minPrice,
    this.sortType,
    this.sortBy,
  });
}
