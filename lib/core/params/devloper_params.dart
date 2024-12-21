import 'package:equatable/equatable.dart';

class DeveloperParams extends Equatable {
  final String? id;

  const DeveloperParams({
    required this.id,
  });

  @override
  List<Object?> get props => <Object?>[
        id,
      ];
}
