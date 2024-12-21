import '/features/tabBar/data/datasources/tabbar_remote_data_source.dart';
import '/features/tabBar/domain/repositories/tabbar_repository.dart';

class TabBarRepositoryImpl implements TabBarRepository {
  final TabBarRemoteDataSource remoteDataSource;

  TabBarRepositoryImpl({required this.remoteDataSource});
}
