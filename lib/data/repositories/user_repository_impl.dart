import 'package:base_constructor/data/exception/exception.dart';
import 'package:base_constructor/data/local/entity/staff_db.dart';
import 'package:base_constructor/domain/repositorires/user_repository.dart';

class UserRepositoryImpl extends UserRepository{
  static final UserRepositoryImpl _singleton = UserRepositoryImpl._internal();
  UserRepositoryImpl._internal();

  factory UserRepositoryImpl() {
    return _singleton;
  }

  @override
  Future<void> deleteAll() {
    return null;
  }

  @override
  Future<List<StaffDB>> getAllStaff() {
    throw CustomException(123, 'msg error');
  }

  @override
  Future<StaffDB> getStaff(int id) {
    return null;
  }

  @override
  Future<void> insertStaff(StaffDB item) {
    return null;
  }

  @override
  Future<void> insertStaffs(List<StaffDB> items) {
    return null;
  }
}