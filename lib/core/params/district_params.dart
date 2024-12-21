import 'package:equatable/equatable.dart';

class DistrictParams extends Equatable {
  final String? name;
  final String? cityId;

  const DistrictParams({
    this.name,
    this.cityId,
  });

  @override
  List<Object?> get props => <Object?>[
        name,
        cityId,
      ];
}
