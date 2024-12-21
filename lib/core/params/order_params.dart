import 'package:equatable/equatable.dart';

class OrderParams extends Equatable {
  final String? status;

  const OrderParams({
     this.status,
  });

  @override
  List<Object?> get props => [status];
}
