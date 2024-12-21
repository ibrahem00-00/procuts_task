import '/core/base_classes/base_one_response.dart';

class ProductDeleteRespModel extends BaseOneResponse {
  const ProductDeleteRespModel({
    super.statusCode,
    super.message,
    super.data,
  });

  factory ProductDeleteRespModel.fromJson(Map<String, dynamic> json) {
    return ProductDeleteRespModel(
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
      data: json['data'] != null
          ? ProductDeleteModel.fromJson(json['data'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'statusCode': statusCode,
        'message': message,
        'data': data?.toJson(),
      };
}

class ProductDeleteModel extends ProductDeleteEntity {
  const ProductDeleteModel();

  factory ProductDeleteModel.fromJson(Map<String, dynamic> json) {
    return const ProductDeleteModel();
  }

  Map<String, dynamic> toJson() => {};
}

class ProductDeleteEntity {
  const ProductDeleteEntity();
}
