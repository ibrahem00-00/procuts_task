import 'dart:io';

import 'package:equatable/equatable.dart';

class StoreSettingsParams extends Equatable {
  final String? name;
  final String? description;
  final String? address;
  final String? minOrderCost;
  final String? cityId;
  final String? vendorId;
  final String? lat;
  final String? lng;
  final File? file;

  const StoreSettingsParams({
    this.name,
    this.file,
    this.description,
    this.address,
    this.minOrderCost,
    this.cityId,
    this.vendorId,
    this.lat,
    this.lng,
  });

  @override
  List<Object?> get props => <Object?>[
        name,
        file,
        description,
        address,
        minOrderCost,
        cityId,
        vendorId,
        lat,
        lng
      ];
}
