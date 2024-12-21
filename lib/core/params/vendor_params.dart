import 'dart:io';

import 'package:equatable/equatable.dart';

class VendorParams extends Equatable {
  final String? name;
  final File? logoImage;
  final String? description;

  const VendorParams({
    this.name,
    this.logoImage,
    this.description,
  });

  @override
  List<Object?> get props => <Object?>[
        name,
        logoImage,
        description,
      ];
}
