import 'dart:io';

import 'package:equatable/equatable.dart';

class SpecialityParams extends Equatable {
  final String? name;
  final File? image;

  const SpecialityParams({
    this.name,
    this.image,
  });

  @override
  List<Object?> get props => <Object?>[
        name,
        image,
      ];
}
