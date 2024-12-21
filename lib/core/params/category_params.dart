import 'dart:io';

import 'package:equatable/equatable.dart';

class CategoryParams extends Equatable {
  final String? name;
  final String? categoryId;
  final bool? isEnabled;
  final File? file;

  const CategoryParams({
    this.name,
    this.isEnabled,
    this.file,
    this.categoryId,
  });

  @override
  List<Object?> get props => <Object?>[name, isEnabled, file, categoryId];
}
