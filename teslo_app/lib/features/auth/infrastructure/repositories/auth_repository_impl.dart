import 'package:teslo_shop/features/auth/domain/domain.dart';
import 'package:teslo_shop/features/auth/infrastructure/infrastructure.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDatasource datasource;

  AuthRepositoryImpl([AuthDatasource? datasource])
      : datasource = datasource ?? AuthDatasourceImpl();

  @override
  Future<User> checkOutStatus(String token) {
    return datasource.checkOutStatus(token);
  }

  @override
  Future<User> login(String email, String password) {
    return datasource.login(email, password);
  }

  @override
  Future<User> register(String email, String password, String fullName) {
    return datasource.register(email, password, fullName);
  }
}
