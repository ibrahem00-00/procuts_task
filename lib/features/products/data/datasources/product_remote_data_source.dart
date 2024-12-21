import 'package:procuts_task/core/api/end_points.dart';
import 'package:procuts_task/core/params/filter_params.dart';
import 'package:procuts_task/features/products/data/models/product_resp_model.dart';
import 'package:procuts_task/injection_container.dart';

abstract class ProductRemoteDataSource {
  Future<ProductsRespModel> getProducts({required FilterParams params});
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  @override
  Future<ProductsRespModel> getProducts({required FilterParams params}) async {
    try {
      final response =
          await dioConsumer.get(EndPoints.allProducts, queryParameters: {
        'page': params.page,
        'products_per_page': params.limit,
        'category': 'assorted-bakeries',
        'sort[arrangement]': params.arrangement,
        'sort[criteria]': params.criteria,
        'price_range[0]': params.priceFrom ?? 0,
        'price_range[1]': params.priceTo ?? 10000,
      });
      return ProductsRespModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
